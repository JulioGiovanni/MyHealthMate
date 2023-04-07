import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage:
                NetworkImage('https://www.w3schools.com/howto/img_avatar.png'),
          ),
          SizedBox(height: 20),
          Text(
            'Nombre Apellido',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Card(
            color: Colors.white,
            shadowColor: Colors.black,
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text('Información Básica'),
              subtitle: Text('Nombre Apellido'),
              trailing: Icon(Icons.arrow_forward_rounded),
            ),
          ),
          SizedBox(height: 10),
          Card(
            color: Colors.white,
            shadowColor: Colors.black,
            child: ListTile(
              leading: Icon(Icons.shield),
              title: Text('Identificación y seguro médico'),
              subtitle: Text(
                  'Consulta,edita o completa tus datos de identificación y los de tu seguro médico',
                  style: TextStyle(fontSize: 12)),
              trailing: Icon(Icons.arrow_forward_rounded),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            color: ThemeData().colorScheme.surface,
            shadowColor: Colors.black,
            child: const ListTile(
              leading: Icon(Icons.location_city_rounded),
              title: Text('Dirección'),
              subtitle: Text('Calle, número, ciudad, provincia, código postal'),
              trailing: Icon(Icons.arrow_forward_rounded),
            ),
          ),
          const SizedBox(height: 10),
          const Card(
            color: Colors.white,
            shadowColor: Colors.black,
            child: ListTile(
              leading: Icon(Icons.monitor_heart_rounded),
              title: Text('Historial Médico'),
              subtitle: Text(
                  'Consulta o edita la información de tu historial médico'),
              trailing: Icon(Icons.arrow_forward_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
