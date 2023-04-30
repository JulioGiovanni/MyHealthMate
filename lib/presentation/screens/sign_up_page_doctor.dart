import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/sign_up_provider.dart';

class SignUpPageDoctor extends StatelessWidget {
  const SignUpPageDoctor({super.key});

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
            height: 30,
          ),
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Nombre(s)"),
            controller: context.read<SignUpProvider>().nameController,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Apellidos"),
            controller: context.read<SignUpProvider>().lastNameController,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Numero de contacto"),
            controller: context.read<SignUpProvider>().numberController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Especialidad"),
            controller: context.read<SignUpProvider>().specController,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Universidad de egreso"),
            controller: context.read<SignUpProvider>().uniController,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Años de experiencia"),
            controller: context.read<SignUpProvider>().expController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Número de cédula profesional"),
            controller: context.read<SignUpProvider>().cedPController,
            keyboardType: TextInputType.text,
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
                elevation: 10,
                height: 60,
                onPressed: () {
                  context.read<SignUpProvider>().SetIsDoctor(true);
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
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
