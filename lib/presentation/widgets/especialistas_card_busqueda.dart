import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/screens/agendar_cita.dart';
import 'package:myhealthmate/presentation/widgets/custom_chip.dart';
import 'package:myhealthmate/presentation/widgets/rating_stars.dart';

class EspecialistasBusqueda extends StatelessWidget {
  const EspecialistasBusqueda({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://www.w3schools.com/howto/img_avatar.png'),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Nombre y apellido especialista'),
                      Text('Categoría'),
                      RatingStars(rating: 4)
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(width: 5),
                  const Text('Dirección'),
                  MaterialButton(
                      onPressed: () {},
                      child: const Text(
                        'Ver mapa',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                      ))
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.medical_services),
                  const SizedBox(width: 5),
                  const Text('Consulta'),
                  Expanded(child: Container()),
                  const Text('Precio: \$ 1000'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Icon(Icons.calendar_month_outlined),
                  SizedBox(width: 5),
                  Text('Próxima fecha:'),
                  SizedBox(width: 5),
                  Text('Lunes 30 de Febrero del 2050'),
                ],
              ),
              Row(
                children: [
                  CustomChip(
                      label: 'Hora 1',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AgendarCitaScreen(),
                          ),
                        );
                      }),
                  const SizedBox(width: 10),
                  CustomChip(
                      label: 'Hora 2',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AgendarCitaScreen(),
                          ),
                        );
                      }),
                  const SizedBox(width: 10),
                  CustomChip(
                      label: 'Hora 3',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AgendarCitaScreen(),
                          ),
                        );
                      }),
                  const SizedBox(width: 10),
                  CustomChip(
                      label: 'Ver más',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AgendarCitaScreen(),
                          ),
                        );
                      }),
                ],
              ),
            ],
          )),
    );
  }
}
