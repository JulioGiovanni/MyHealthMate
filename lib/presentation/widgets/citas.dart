import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/screens/detalle_cita_screen.dart';

class Citas extends StatelessWidget {
  const Citas({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Citas',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              //Convert to uppercase
              Text('Próximas citas'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  )),
              ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DetalleCitaScreen()));
                      },
                      child: Card(
                        elevation: 0,
                        child: Container(
                          color: Colors.white,
                          child: ListTile(
                            title: const Text('Categoría'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Nombre y apellido especialista'),
                                Text('Fecha'),
                              ],
                            ),
                            trailing: const CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                  'https://www.w3schools.com/howto/img_avatar.png'),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics()),
              const SizedBox(height: 10),
              Text('Historial de citas'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  )),
              ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 5,
                      ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const DetalleCitaScreen()));
                      },
                      child: Card(
                        elevation: 0,
                        child: Container(
                          color: Colors.white,
                          child: ListTile(
                            title: const Text('Categoría'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Nombre y apellido especialista'),
                                Text('Fecha'),
                              ],
                            ),
                            trailing: const CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                  'https://www.w3schools.com/howto/img_avatar.png'),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics()),
            ],
          ),
        ));
  }
}
