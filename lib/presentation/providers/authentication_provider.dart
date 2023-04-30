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
  bool _isADoctor = false; // Habilita vista de Doctor o de Usuario/Paciente

  void setIsADoctor(bool b) {
    _isADoctor = b;
  }

  void toLogin(BuildContext context, bool isADoctor) {
    _isADoctor = isADoctor;
    _loggedIn = true;
    notifyListeners();
  }

  void logout(BuildContext context) {
    _loggedIn = false;
    notifyListeners();
  }
}
