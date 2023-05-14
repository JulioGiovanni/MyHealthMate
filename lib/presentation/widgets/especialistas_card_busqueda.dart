import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/constants/env_variables.dart';
import 'package:myhealthmate/presentation/models/doctor/doctor.dart';
import 'package:myhealthmate/presentation/screens/agendar_cita.dart';
import 'package:myhealthmate/presentation/widgets/rating_stars.dart';

class EspecialistasBusqueda extends StatelessWidget {
  const EspecialistasBusqueda({super.key, required this.doctor});
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    var urlImage = doctor.foto.isNotEmpty
        ? environment['supabaseUrl']! +
            doctor.foto! +
            '?apikey=' +
            environment['token']!
        : null;
    return Card(
      child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: urlImage == null
                        ? NetworkImage(
                            'https://www.w3schools.com/howto/img_avatar.png')
                        : NetworkImage(urlImage),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(doctor.nombre!),
                      Text(doctor.especialidad!.nombre!),
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
                  Text(doctor.direccion!),
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
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AgendarCitaScreen(
                            doctor: doctor,
                          )));
                },
                elevation: 0, // no tiene elevación
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: const BorderSide(color: Colors.grey),
                ), // borde poco redondeado y gris
                color: Colors.white, // fondo blanco
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons
                        .calendar_month_outlined), // ícono a la izquierda del texto
                    SizedBox(width: 8), // espacio entre el ícono y el texto
                    Text('Agendar Cita'), // texto centrado
                  ],
                ),
              )
              // Row(
              //   children: const [
              //     Icon(Icons.calendar_month_outlined),
              //     SizedBox(width: 5),
              //     Text('Próxima fecha:'),
              //     SizedBox(width: 5),
              //     Text('Lunes 30 de Febrero del 2050'),
              //   ],
              // ),
              // Row(
              //   children: [
              //     CustomChip(
              //         label: 'Hora 1',
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) =>
              //                   AgendarCitaScreen(doctor: doctor),
              //             ),
              //           );
              //         }),
              //     const SizedBox(width: 10),
              //     CustomChip(
              //         label: 'Hora 2',
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) =>
              //                   AgendarCitaScreen(doctor: doctor),
              //             ),
              //           );
              //         }),
              //     const SizedBox(width: 10),
              //     CustomChip(
              //         label: 'Hora 3',
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) =>
              //                   AgendarCitaScreen(doctor: doctor),
              //             ),
              //           );
              //         }),
              //     const SizedBox(width: 10),
              //     CustomChip(
              //         label: 'Ver más',
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) =>
              //                   AgendarCitaScreen(doctor: doctor),
              //             ),
              //           );
              //         }),
              //   ],
              // ),
            ],
          )),
    );
  }
}
