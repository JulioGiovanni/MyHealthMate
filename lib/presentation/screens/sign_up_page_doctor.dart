import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/providers/auth.provider.dart';
import 'package:provider/provider.dart';

class SignUpPageDoctor extends StatelessWidget {
  const SignUpPageDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("MyHealthMate"),
        ),
        body: Consumer<AuthProvider>(
          builder: (context, provider, child) {
            return ListView(
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
                      border: OutlineInputBorder(),
                      labelText: "Nombre completo"),
                  controller: provider.nombre,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Numero de contacto"),
                  controller: provider.telefono,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Especialidad"),
                  controller: provider.especialidad,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Universidad de egreso"),
                  controller: provider.formacion,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Años de experiencia"),
                  controller: provider.experiencia,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Número de cédula profesional"),
                  controller: provider.cedula,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Mail"),
                  controller: provider.email,
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
                  controller: provider.password,
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
                        provider.signUpDoctor();
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
            );
          },
        ));
  }
}
