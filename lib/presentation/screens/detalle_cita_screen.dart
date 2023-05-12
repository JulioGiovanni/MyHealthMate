import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/constants/env_variables.dart';
import 'package:myhealthmate/presentation/models/cita/cita.dart';
import 'package:myhealthmate/presentation/providers/auth.provider.dart';
import 'package:myhealthmate/presentation/screens/chat_screen.dart';
import 'package:myhealthmate/presentation/widgets/abrir_mapa_button.dart';
import 'package:provider/provider.dart';

class DetalleCitaScreen extends StatelessWidget {
  const DetalleCitaScreen({Key? key, required this.cita}) : super(key: key);
  final Cita cita;

  @override
  Widget build(BuildContext context) {
    double latitude = 20.608552;
    double longitude = -103.414654;
    var urlImage = context.watch<AuthProvider>().isDoctor
        ? cita.usuario?.foto != null
            ? environment['supabaseUrl']! +
                cita.usuario!.foto! +
                '?apikey=' +
                environment['token']!
            : null
        : cita.doctor?.foto != null
            ? environment['supabaseUrl']! +
                cita.doctor!.foto! +
                '?apikey=' +
                environment['token']!
            : null;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalles de la visita'),
        ),
        body: context.watch<AuthProvider>().isDoctor
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 3, // controla la elevación de la sombra
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10)), // forma redondeada
                    child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(
                            16), // espacio alrededor del contenido
                        color: Colors.white, // fondo blanco
                        child: Column(children: [
                          ListTile(
                            trailing: CircleAvatar(
                              radius: 20,
                              backgroundImage: urlImage == null
                                  ? NetworkImage(
                                      'https://www.w3schools.com/howto/img_avatar.png')
                                  : NetworkImage(urlImage),
                            ),
                            title: Text(cita.usuario!.nombre!),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(cita.usuario!.nombre!),
                                Text(cita.fecha!),
                              ],
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                      id1: cita.usuario!.id!,
                                      id2: cita.doctor!.id!,
                                      nombre: cita.usuario!.nombre!)));
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
                                    .message), // ícono a la izquierda del texto
                                SizedBox(
                                    width:
                                        8), // espacio entre el ícono y el texto
                                Text('Enviar Mensaje'), // texto centrado
                              ],
                            ),
                          )
                        ])),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Resumen de la cita'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        )),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 16),
                        Text(cita.fecha!),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Divider(),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 16),
                        VerEnMapaButton(
                            latitude: latitude, longitude: longitude)
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Divider(),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.home_repair_service_outlined,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cita.motivo!),
                            SizedBox(height: 8),
                            Text(
                              '60min * 1000',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Divider(),
                  ),
                  const SizedBox(height: 30),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 3, // controla la elevación de la sombra
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10)), // forma redondeada
                    child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(
                            16), // espacio alrededor del contenido
                        color: Colors.white, // fondo blanco
                        child: Column(children: [
                          ListTile(
                            trailing: CircleAvatar(
                              radius: 20,
                              backgroundImage: urlImage == null
                                  ? NetworkImage(
                                      'https://www.w3schools.com/howto/img_avatar.png')
                                  : NetworkImage(urlImage),
                            ),
                            title: Text(cita.doctor!.especialidad!.nombre!),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(cita.doctor!.nombre!),
                                Text(cita.fecha!),
                              ],
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                      id1: cita.usuario!.id!,
                                      id2: cita.doctor!.id!,
                                      nombre: cita.doctor!.nombre!)));
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
                                    .message), // ícono a la izquierda del texto
                                SizedBox(
                                    width:
                                        8), // espacio entre el ícono y el texto
                                Text('Enviar Mensaje'), // texto centrado
                              ],
                            ),
                          )
                        ])),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Resumen de la cita'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        )),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 16),
                        Text(cita.fecha!),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Divider(),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 16),
                        VerEnMapaButton(
                            latitude: latitude, longitude: longitude)
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Divider(),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.home_repair_service_outlined,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cita.motivo!),
                            SizedBox(height: 8),
                            Text(
                              '60min * 1000',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Divider(),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Métodos de pago aceptados'.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        )),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.payments_rounded,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Método de pago'),
                            SizedBox(height: 8),
                            Text(
                              'Tarjeta de crédito, débito o transferencia',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Divider(),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GestureDetector(
                      onTap: () => _showBottomSheet(context),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.receipt_long_outlined,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 16),
                          Text('Detalles de pago y reembolso'),
                          Expanded(child: SizedBox()),
                          Icon(Icons.arrow_forward_ios_rounded,
                              color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Divider(),
                  ),
                ],
              ));
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Column(
            children: <Widget>[
              ListTile(
                title: const Text('Detalles de pago y reembolso'),
                trailing: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[300],
                  child: Center(
                    child: Text(cita.doctor!.reembolso!),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
