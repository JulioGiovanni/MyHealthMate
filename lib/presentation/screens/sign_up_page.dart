import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/sign_up_provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyHealthMate"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          const Image(
            image: AssetImage('assets/app_icon.png'),
            height: 250,
          ),
          const Text(
            "Crear cuenta",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(children: [
            Expanded(
              child: MaterialButton(
                elevation: 3,
                height: 60,
                onPressed: () {
                  context.read<SignUpProvider>().SignUpGoogle(context);
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
                    Text('Registrarse con Google',
                        style: TextStyle(
                          fontSize: 15,
                        )),
                  ],
                ),
              ),
            )
          ]),
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
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Mail"),
            controller: context.read<SignUpProvider>().mailSController,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Verifica tu mail"),
            controller: context.read<SignUpProvider>().confirmMailController,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Password:"),
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            controller: context.read<SignUpProvider>().passSController,
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
                  context.read<SignUpProvider>().SetIsDoctor(false);
                  context.read<SignUpProvider>().SignUpMail(context);
                  Navigator.pop(context);
                },
                color: Colors.blue,
                padding: const EdgeInsets.all(0),
                child: const Text('Registrarme',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
