import 'package:flutter/material.dart';

class Mensajes extends StatelessWidget {
  const Mensajes({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Mensajes',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          //Convert to uppercase
          Text('Bandeja de entrada'.toUpperCase(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              )),
          ListView.builder(
              itemBuilder: (context, index) {
                return const Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://www.w3schools.com/howto/img_avatar.png'),
                    ),
                    title: Text('Nombre Apellido'),
                    subtitle: Text('Mensaje'),
                    trailing: Text('Fecha'),
                  ),
                );
              },
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics())
        ]),
      ),
    );
  }
}
