import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/providers/login_provider.dart';

class SignUpProvider with ChangeNotifier {
  static final SignUpProvider _signUpProvider = SignUpProvider._internal();
  factory SignUpProvider() {
    return _signUpProvider;
  }
  SignUpProvider._internal();

  final loginProvider = LoginProvider();

  void SignUpGoogle(BuildContext context) {
    loginProvider.loginGoogle(context);
  }

  var mailSController = TextEditingController();
  var confirmMailController = TextEditingController();
  var passSController = TextEditingController();

  void SignUpMail(BuildContext context) {
    //No hace login en automático, solo registra al usuario y regresa a la página para seleccionar login
  }
}
