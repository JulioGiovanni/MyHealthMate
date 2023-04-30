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

  void login(BuildContext context) {
    _loggedIn = true;
    notifyListeners();
  }

  void logout(BuildContext context) {
    _loggedIn = false;
    notifyListeners();
  }
}
