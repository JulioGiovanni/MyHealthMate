import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthmate/presentation/constants/env_variables.dart';
import 'package:myhealthmate/presentation/models/conversation/conversation.dart';
import 'package:myhealthmate/presentation/models/doctor/doctor.dart';
import 'package:myhealthmate/presentation/models/login/usuario.dart';
import 'package:myhealthmate/presentation/providers/auth.provider.dart';

class DataProvider with ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  List<dynamic> especialidades = [];
  List cards = [];
  List<Conversation> conversations = [];
  dynamic user;
  AuthProvider authProvider = AuthProvider();

  getEspecialidades() async {
    await http
        .get(Uri.parse(environment['apiUrl']! + 'especialidades'))
        .then((response) async {
      if (response.statusCode == 200) {
        especialidades = jsonDecode(response.body) as List<dynamic>;
        notifyListeners();
      } else {
        notifyListeners();
      }
    });
  }

  getLast5Doctors() async {
    var response =
        await http.get(Uri.parse(environment['apiUrl']! + 'lastdoctors'));
    if (response.statusCode == 200) {
      // cards = response.body;
      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  getConversations() async {
    if (authProvider.isAuth) {
      if (authProvider.isDoctor) {
        user = authProvider.user as Doctor;
      } else {
        user = authProvider.user as Usuario;
      }
    } else
      return;
    var response = await http.get(Uri.parse(environment['apiUrl']! +
        'mensajes/conversations/${authProvider.user.id}'));
    if (response.statusCode == 200) {
      conversations = (jsonDecode(response.body) as List<dynamic>)
          .map((e) => Conversation.fromJson(e))
          .toList();
      notifyListeners();
    } else {
      notifyListeners();
    }
  }
}
