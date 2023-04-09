import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage:
                NetworkImage('https://www.w3schools.com/howto/img_avatar.png'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Nombre Apellido',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 0.5,
            child: Container(
              color: Colors.white,
              child: const ListTile(
                leading: Icon(Icons.person),
                title: Text('Información Básica'),
                subtitle: Text('Nombre Apellido'),
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
        ],
      ),
    );
  }
}
