import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  static final AuthenticationProvider _AuthenticationProvider =
      AuthenticationProvider._internal();
  factory AuthenticationProvider() {
    return _AuthenticationProvider;
  }
  AuthenticationProvider._internal();

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;
  bool _isADoctor = false;
  bool get isADoctor => _isADoctor; // Habilita vista de Doctor o de Usuario/Paciente

  void toLogin(BuildContext context, bool isADoctor) {
    _isADoctor = isADoctor;
    _loggedIn = true;
    notifyListeners();
  }

  void logout(BuildContext context) {
    _loggedIn = false;
    _isADoctor = false;
    notifyListeners();
  }
}
