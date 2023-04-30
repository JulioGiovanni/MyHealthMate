import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/login_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyHealthMate"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const Image(
                image: AssetImage('assets/app_icon.png'),
                height: 250,
              ),
              const Text(
                "Accede a tu cuenta",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Mail:"),
                controller:
                    context.read<LoginProvider>().mailController,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Password:"),
                controller:
                    context.read<LoginProvider>().passController,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                Expanded(
                  child: MaterialButton(
                    elevation: 0,
                    height: 60,
                    onPressed: () {
                      context.read<LoginProvider>().loginMail(context);
                      Navigator.pop(context);
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
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "He olvidado mi contraseña",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 15,
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 1.0,
                      width: 130.0,
                      color: Colors.black,
                    ),
                  ),
                  const Text("o"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 1.0,
                      width: 130.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(children: [
                Expanded(
                  child: MaterialButton(
                    elevation: 3,
                    height: 60,
                    onPressed: () {
                      context
                          .read<LoginProvider>()
                          .loginGoogle(context);
                      Navigator.pop(context);
                    },
                    color: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Image(
                          image: AssetImage('assets/google_icon.png'),
                          height: 25,
                        ),
                        Text('Ingresar con Google',
                            style: TextStyle(
                              fontSize: 15,
                            )),
                      ],
                    ),
                  ),
                )
              ]),
            ],
          )),
    );
  }
}
