import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/providers/login_provider.dart';

class SignUpProvider with ChangeNotifier {
  static final SignUpProvider _signUpProvider = SignUpProvider._internal();
  factory SignUpProvider() {
    return _signUpProvider;
  }
  SignUpProvider._internal();

  //Campos a registrar para hacer el registro
  //General:
  var mailSController = TextEditingController();
  var confirmMailController = TextEditingController();
  var passSController = TextEditingController();
  bool _isADoctor = false;

  // Doctor
  var nameController = TextEditingController();
  var lastNameController = TextEditingController();
  var numberController = TextEditingController();

  var specController = TextEditingController();
  var uniController = TextEditingController();
  var expController = TextEditingController();
  var cedPController = TextEditingController();

  //
  void SetIsDoctor(bool b) {
    _isADoctor = b;
  }

  void cleanSignUpFields() {
    // limpiando campos
    mailSController.clear();
    confirmMailController.clear();
    passSController.clear();
    _isADoctor = false;
    nameController.clear();
    lastNameController.clear();
    numberController.clear();
    specController.clear();
    uniController.clear();
    expController.clear();
    cedPController.clear();
  }

  //
  final loginProvider = LoginProvider();
  void SignUpGoogle(BuildContext context) {
    //Al hacer el registro con google el login se hace en automático
    loginProvider.loginGoogle(context);
    cleanSignUpFields();
  }

  void SignUpMail(BuildContext context) {
    //No hace login en automático, solo registra al usuario y regresa a la página para seleccionar login

    cleanSignUpFields();
  }
}
