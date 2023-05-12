import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:myhealthmate/presentation/constants/env_variables.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthmate/presentation/models/doctor/doctor.dart';
import 'package:myhealthmate/presentation/models/login/login.dart';
import 'package:myhealthmate/presentation/models/login/usuario.dart';
import 'package:myhealthmate/presentation/providers/cita.provider.dart';
import 'package:myhealthmate/presentation/providers/data.provider.dart';
import 'package:provider/provider.dart';

class AuthProvider with ChangeNotifier {
  static final AuthProvider _authProvider = AuthProvider._internal();
  factory AuthProvider() {
    return _authProvider;
  }
  AuthProvider._internal();

  bool _isLoading = false;
  bool _isAuth = false;
  bool _isDoctor = false;
  dynamic _user;
  String _token = '';
  bool get isAuth => _isAuth;
  bool get isDoctor => _isDoctor;
  String get token => _token;
  bool get isLoading => _isLoading;
  dynamic get user => _user;
  //Campos a registrar para hacer login y registro

  //General:
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController telefono = TextEditingController();
  TextEditingController direccion = TextEditingController();
  TextEditingController fechaNacimiento = TextEditingController();
  TextEditingController genero = TextEditingController();

  // Doctor
  TextEditingController especialidad = TextEditingController();
  TextEditingController cedula = TextEditingController();
  TextEditingController hospital = TextEditingController();
  TextEditingController horario = TextEditingController();
  TextEditingController idiomas = TextEditingController();
  TextEditingController formacion = TextEditingController();
  TextEditingController experiencia = TextEditingController();

  void verifyAuth() async {
    var box = await Hive.openBox('auth');
    _token = box.get('token') ?? '';

    http.get(Uri.parse(environment['apiUrl']! + '/verify'), headers: {
      'Authorization': 'Bearer $_token',
    }).then((response) async {
      if (response.statusCode == 200) {
        var body =
            Login.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
        _isAuth = true;
        _token = body.token!;
        _user = Usuario.fromJson(jsonDecode(response.body)['usuario']);
        saveUserInHive(_user, _token, false);
        notifyListeners();
      } else {
        _isAuth = false;
        deleteUserInHive();
        notifyListeners();
      }
    });
  }

  void isDoctorChange(bool value) {
    _isDoctor = value;
    notifyListeners();
  }

  getUserInHive(isDoctor) async {
    var box = isDoctor
        ? await Hive.openBox<Doctor>('doctor')
        : await Hive.openBox<Usuario>('user');
    _user = isDoctor ? box.get('doctor') : box.get('user');
  }

  void saveUserInHive(user, token, isDoctor) async {
    var box = isDoctor
        ? await Hive.openBox<Doctor>('doctor')
        : await Hive.openBox<Usuario>('user');
    var tokenBox = await Hive.openBox('token');
    await isDoctor ? box.put('doctor', user) : box.put('user', user);
    await tokenBox.put('token', token);
  }

  void deleteUserInHive() async {
    var userBox = await Hive.openBox<Usuario>('user');
    var tokenBox = await Hive.openBox('token');
    await userBox.put('user', Usuario());
    await tokenBox.put('token', '');
  }

  void login(context) async {
    _isLoading = true;
    notifyListeners();
    //Login de usuario
    var response = await http
        .post(Uri.parse(environment['apiUrl']! + 'auth/login'), body: {
      'email': email.text,
      'password': password.text,
    });
    if (response.statusCode == 201) {
      var body =
          Login.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      _isAuth = true;
      _token = body.token!;
      _user = Usuario.fromJson(jsonDecode(response.body)['usuario']);
      _isLoading = false;
      saveUserInHive(_user, _token, false);
      cleanFields();
      final citasProvider = Provider.of<CitaProvider>(context, listen: false);
      final dataProvider = Provider.of<DataProvider>(context, listen: false);
      await citasProvider.getCitas();
      await citasProvider.getPreviousCitas();
      await dataProvider.getConversations();
      notifyListeners();
      Navigator.of(context).pop();
    } else {
      //Si no logra hacer login de usuario, intentará hacer login de doctor
      loginDoctor(context);
    }
  }

  void loginGoogle() {
    notifyListeners();
  }

  void logout() {
    notifyListeners();
  }

  void signUp() {
    notifyListeners();
  }

  void signUpDoctor() {
    notifyListeners();
  }

  void signUpGoogle() {
    notifyListeners();
  }

  void loginDoctor(context) async {
    var response = await http
        .post(Uri.parse(environment['apiUrl']! + 'doctor-auth/login'), body: {
      'email': email.text,
      'password': password.text,
    });
    if (response.statusCode == 201) {
      var body =
          Login.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      _isAuth = true;
      _isDoctor = true;
      _token = body.token!;
      _isLoading = false;
      _user = Doctor.fromJson(jsonDecode(response.body)['doctor']);
      saveUserInHive(_user, _token, true);
      final citasProvider = Provider.of<CitaProvider>(context, listen: false);
      final dataProvider = Provider.of<DataProvider>(context, listen: false);
      await citasProvider.getCitas();
      await dataProvider.getConversations();
      notifyListeners();
      Navigator.of(context).pop();
    } else {
      //Si ninguno de los dos funciona, se queda en la pantalla de login
      _isAuth = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  void cleanFields() {
    email.clear();
    password.clear();
    nombre.clear();
    telefono.clear();
    direccion.clear();
    fechaNacimiento.clear();
    genero.clear();
    especialidad.clear();
    cedula.clear();
    hospital.clear();
    horario.clear();
    idiomas.clear();
    formacion.clear();
  }

  void signOut() async {
    _isAuth = false;
    _isDoctor = false;
    _token = '';
    deleteUserInHive();
    notifyListeners();
  }
}
