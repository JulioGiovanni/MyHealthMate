import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthmate/presentation/constants/env_variables.dart';
import 'package:myhealthmate/presentation/models/cita/cita.dart';
import 'package:myhealthmate/presentation/models/doctor/doctor.dart';
import 'package:myhealthmate/presentation/models/login/usuario.dart';
import 'package:myhealthmate/presentation/providers/auth.provider.dart';
import 'package:myhealthmate/presentation/screens/initial_screen.dart';
import 'package:myhealthmate/presentation/screens/login_page.dart';

class CitaProvider with ChangeNotifier {
  static final CitaProvider _citaProvider = CitaProvider._internal();
  factory CitaProvider() {
    return _citaProvider;
  }
  CitaProvider._internal();
  String _date = "No se ha seleccionado la fecha";
  String _motivo = "";
  bool _isLoading = false;
  List<Cita> _citas = [];
  List<Cita> _historialCitas = [];
  String _from = '';
  String _to = '';
  dynamic user;

  String get date => _date;
  String get motivo => _motivo;
  bool get isLoading => _isLoading;
  List<Cita> get citas => _citas;
  List<Cita> get historialCitas => _historialCitas;
  String get from => _from;
  String get to => _to;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  set from(String from) {
    _from = from;
    notifyListeners();
  }

  set to(String to) {
    _to = to;
    notifyListeners();
  }

  AuthProvider authProvider = AuthProvider();

  getCitas() async {
    if (authProvider.isAuth) {
      if (authProvider.isDoctor) {
        user = authProvider.user as Doctor;
      } else {
        user = authProvider.user as Usuario;
      }
    } else
      return;
    // if (!authProvider.isAuth) return;
    String queryClause = '';
    if (_from != 'null' && to != 'null') {
      queryClause = '&from=$from&to=$to';
    } else if (from != 'null') {
      queryClause = '&from=$from';
    } else if (to != 'null') {
      queryClause = '&to=$to';
    }
    if (authProvider.isDoctor) {
      var response = await http.get(
          Uri.parse(environment['apiUrl']! +
              'citas/doctor?id=${authProvider.user.id}$queryClause'),
          headers: {
            'Authorization': 'Bearer ${authProvider.token}',
          });
      if (response.statusCode == 200) {
        _isLoading = false;
        var body = jsonDecode(response.body) as List<dynamic>;
        _citas = body.map((dynamic item) => Cita.fromJson(item)).toList();
        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();
      }
    } else {
      var response = await http.get(
          Uri.parse(environment['apiUrl']! +
              'citas?id=${authProvider.user.id}$queryClause'),
          headers: {
            'Authorization': 'Bearer ${authProvider.token}',
          });
      if (response.statusCode == 200) {
        _isLoading = false;
        var body = jsonDecode(response.body) as List<dynamic>;
        _citas = body.map((dynamic item) => Cita.fromJson(item)).toList();
        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();
      }
    }
  }

  getPreviousCitas() async {
    if (authProvider.isAuth) {
      if (authProvider.isDoctor) {
        user = authProvider.user as Doctor;
      } else {
        user = authProvider.user as Usuario;
      }
    } else
      return;
    _isLoading = true;
    var response = await http.get(
        Uri.parse(environment['apiUrl']! +
            'citas/previous?id=${authProvider.user.id}'),
        headers: {
          'Authorization': 'Bearer ${authProvider.token}',
        });
    if (response.statusCode == 200) {
      _isLoading = false;
      var body = jsonDecode(response.body) as List<dynamic>;
      _historialCitas =
          body.map((dynamic item) => Cita.fromJson(item)).toList();
      notifyListeners();
    } else {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setMotivo(motivo) {
    _motivo = motivo;
  }

  void selectDate(date) {
    _date = date;
    notifyListeners();
  }

  cleanFields() {
    _date = "No se ha seleccionado la fecha";
    _motivo = "";
    notifyListeners();
  }

  void agendarCita(context, doctor) async {
    //Verifica si tiene sesión
    if (authProvider.isAuth) {
      //Verifica que se haya ingresado la fecha y el motivo de la cita
      if (_date == "No se ha seleccionado la fecha" ||
          _motivo == "No se ha ingresado el motivo") {
        //Si no se ha ingresado la fecha o el motivo muestra un error
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("No se ha seleccionado la fecha o el motivo"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Aceptar"),
                  )
                ],
              );
            });
        //Si se ingresó la fecha y el motivo, crea una cita
      } else {
        _isLoading = true;
        notifyListeners();
        var response =
            await http.post(Uri.parse(environment['apiUrl']! + 'citas'), body: {
          "fecha": _date,
          "doctor": doctor.id,
          "usuario": authProvider.user.id,
          "motivo": _motivo
        });
        if (response.statusCode == 201) {
          _isLoading = false;
          notifyListeners();
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Cita creada"),
                  content: Text("Se ha creado la cita con éxito"),
                  actions: [
                    TextButton(
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => InitialScreen(
                                    indexParameter: 1,
                                  ))),
                      child: Text("Aceptar"),
                    )
                  ],
                );
              });
        } else {
          _isLoading = false;
          notifyListeners();
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Error"),
                  content: Text("No se ha podido crear la cita"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Aceptar"),
                    )
                  ],
                );
              });
        }
      }
      //Si no tiene lo manda al Login
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}
