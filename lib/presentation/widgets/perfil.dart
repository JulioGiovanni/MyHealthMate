import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/constants/env_variables.dart';
import 'package:myhealthmate/presentation/providers/auth.provider.dart';
import 'package:provider/provider.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      if (!provider.isAuth) {
        return const Center(child: CircularProgressIndicator());
      }
      var urlImage = provider.user.foto != null
          ? environment['supabaseUrl']! +
              provider.user.foto! +
              '?apikey=' +
              environment['token']!
          : null;
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: urlImage == null
                  ? NetworkImage(
                      'https://www.w3schools.com/howto/img_avatar.png')
                  : NetworkImage(urlImage),
            ),
            const SizedBox(height: 20),
            Text(
              provider.user.nombre!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 0.5,
              child: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Información Básica'),
                  subtitle: Text(provider.user.nombre!),
                  trailing: Icon(Icons.arrow_forward_rounded),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 0.5,
              child: Container(
                color: Colors.white,
                child: const ListTile(
                  leading: Icon(Icons.shield),
                  title: Text('Identificación y seguro médico'),
                  subtitle: Text(
                      'Consulta,edita o completa tus datos de identificación y los de tu seguro médico',
                      style: TextStyle(fontSize: 12)),
                  trailing: Icon(Icons.arrow_forward_rounded),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 0.5,
              child: Container(
                color: Colors.white,
                child: const ListTile(
                  leading: Icon(Icons.location_city_rounded),
                  title: Text('Dirección'),
                  subtitle:
                      Text('Calle, número, ciudad, provincia, código postal'),
                  trailing: Icon(Icons.arrow_forward_rounded),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              elevation: 0.5,
              child: Container(
                color: Colors.white,
                child: const ListTile(
                  leading: Icon(Icons.monitor_heart_rounded),
                  title: Text('Historial Médico'),
                  subtitle: Text(
                      'Consulta o edita la información de tu historial médico'),
                  trailing: Icon(Icons.arrow_forward_rounded),
                ),
              ),
            ),
            Expanded(child: Container()),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              MaterialButton(
                elevation: 3,
                minWidth: 150,
                onPressed: () {
                  context.read<AuthProvider>().signOut();
                },
                color: Colors.blueGrey,
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    Text('Sign out',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ]),
          ],
        ),
      );
    });
  }
}
