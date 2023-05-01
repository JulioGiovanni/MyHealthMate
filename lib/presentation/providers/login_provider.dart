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
    //Al hacer login, despues de haber verificado las credenciales, se pasa como arguento un booleano que indica y habilita la vista de doctor de ser necesario (este valor booleano se obtiene del registro del usuario en la base de datos)
    var isADoctor =
        true; //por ahora, para pruebas, al iniciar sesión con mail y password se toma como Doctor
    authProvider.toLogin(context, isADoctor);
  }

  void loginGoogle(BuildContext context) {
    //Al hacer login, despues de haber verificado las credenciales, se pasa como arguento un booleano que indica y habilita la vista de doctor de ser necesario (este valor booleano se obtiene del registro del usuario en la base de datos)
    var isADoctor =
        false; //por ahora, para pruebas, al iniciar sesión con gmail se toma como Paciente
    authProvider.toLogin(context, isADoctor);
  }

  void SignOut(BuildContext context) {
    authProvider.logout(context);
  }
}
