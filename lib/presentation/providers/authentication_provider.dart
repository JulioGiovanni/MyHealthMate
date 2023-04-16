import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
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

  // Login
  var mailController = TextEditingController();
  var passController = TextEditingController();
  void loginMail(BuildContext context) {
    login(context);
  }

  void loginGoogle(BuildContext context) {
    login(context);
  }

  //Sign-up
  void SignUpGoogle(BuildContext context) {
    login(context);
  }

  var mailSController = TextEditingController();
  var confirmMailController = TextEditingController();
  var passSController = TextEditingController();

  void SignUpMail(BuildContext context) {}

  // Log-out
  void SignOut(BuildContext context) {
    logout(context);
  }
}
