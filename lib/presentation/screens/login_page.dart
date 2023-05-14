import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/interfaces/credentials.dart';
import 'package:myhealthmate/presentation/providers/auth.provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyHealthMate"),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, provider, child) {
          Credentials credentials = Credentials(
            email: provider.email.text,
            password: provider.password.text,
          );
          return context.watch<AuthProvider>().isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
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
                        controller: provider.email,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Password:"),
                        controller: provider.password,
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
                              provider.login(context);
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              height: 1.0,
                              width: 130.0,
                              color: Colors.black,
                            ),
                          ),
                          const Text("o"),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
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
                              // Navigator.pop(context);
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
                  ));
        },
      ),
    );
  }
}
