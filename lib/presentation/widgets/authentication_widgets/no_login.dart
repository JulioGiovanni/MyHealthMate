import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/screens/login_page.dart';
import 'package:myhealthmate/presentation/screens/sign_up_page.dart';
import 'package:myhealthmate/presentation/screens/sign_up_page_doctor.dart';

class NoLogin extends StatelessWidget {
  const NoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const Image(
            image: AssetImage('assets/app_icon.png'),
            height: 300,
          ),
          const SizedBox(height: 15),
          const Text(
            'Mejora tu salud con MyHealthMate',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Pide cita, contacta con tu especialista y recibe la atención que necesitas',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 5),
          const Text(
            '¡Estamos para ayudar!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          Row(children: [
            Expanded(
              child: MaterialButton(
                elevation: 0,
                height: 60,
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginPage()));
                },
                color: Colors.blue,
                padding: const EdgeInsets.all(0),
                child: const Text('Iniciar sesión',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            )
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '¿No tienes cuenta? ',
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpPage()));
                  },
                  child: const Text(
                    "¡Registrate aqui!",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 15,
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '¿Eres doctor? ',
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpPageDoctor()));
                  },
                  child: const Text(
                    "¡Registrate para ofrecer tus servicios!",
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 15,
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
