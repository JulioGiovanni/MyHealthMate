import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/providers/authentication_provider.dart';

class LoginProvider with ChangeNotifier {
  static final LoginProvider _LoginProvider = LoginProvider._internal();
  factory LoginProvider() {
    return _LoginProvider;
  }
  LoginProvider._internal();

  final authProvider = AuthenticationProvider();

  var mailController = TextEditingController();
  var passController = TextEditingController();
  void loginMail(BuildContext context) {
    authProvider.login(context);
  }

  void loginGoogle(BuildContext context) {
    authProvider.login(context);
  }

  void SignOut(BuildContext context) {
    authProvider.logout(context);
  }
}
