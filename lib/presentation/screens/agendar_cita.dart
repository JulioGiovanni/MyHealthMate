import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/constants/env_variables.dart';
import 'package:myhealthmate/presentation/constants/motivos_cita.dart';
import 'package:myhealthmate/presentation/models/doctor/doctor.dart';
import 'package:myhealthmate/presentation/providers/cita.provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../widgets/abrir_mapa_button.dart';

class AgendarCitaScreen extends StatefulWidget {
  const AgendarCitaScreen({Key? key, required this.doctor}) : super(key: key);
  final Doctor doctor;

  @override
  State<AgendarCitaScreen> createState() => _AgendarCitaScreenState();
}

class _AgendarCitaScreenState extends State<AgendarCitaScreen> {
  String motivoCita = '';
  bool primeraVez = false;

  double latitude = 20.608552;
  double longitude = -103.414654;

  @override
  Widget build(BuildContext context) {
    var urlImage = widget.doctor.foto.isNotEmpty
        ? environment['supabaseUrl']! +
            widget.doctor.foto! +
            '?apikey=' +
            environment['token']!
        : null;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Agendar Cita'),
        ),
        body: Consumer<CitaProvider>(
          builder: (context, provider, child) {
            return provider.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        color: Colors.grey[100],
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image(
                                  image: urlImage == null
                                      ? NetworkImage(
                                          'https://www.w3schools.com/howto/img_avatar.png')
                                      : NetworkImage(urlImage),
                                  width: 120,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      child: Text(widget.doctor.nombre!,
                                          overflow: TextOverflow.clip,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Text(widget.doctor.especialidad!.nombre!,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey[600])),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Icon(Icons.calendar_month_rounded,
                                    size: 18),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(provider.date),
                                    InkWell(
                                      splashColor: Colors.blueAccent,
                                      highlightColor: Colors.blue,
                                      onTap: () {
                                        DatePicker.showDateTimePicker(
                                          context,
                                          showTitleActions: true,
                                          onConfirm: (date) {
                                            setState(() {
                                              provider
                                                  .selectDate(date.toString());
                                              provider.cleanFields();
                                            });
                                          },
                                          currentTime: DateTime.now(),
                                        );
                                      },
                                      child: const Text(
                                        "Cambiar cita",
                                        style: TextStyle(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                SizedBox(width: 20),
                                VerEnMapaButton(
                                    latitude: latitude, longitude: longitude),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Datos relacionados a la cita',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 20),
                            const Text('Motivo de la cita  *',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600)),
                            const SizedBox(height: 10),
                            Card(
                                elevation: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Colors.grey[300]!),
                                      borderRadius: BorderRadius.circular(0),
                                      color: Colors.white),
                                  padding: const EdgeInsets.all(10),
                                  width: double.infinity,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(motivoCita,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600)),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                child: MaterialButton(
                                                    elevation: 0,
                                                    onPressed: () {
                                                      showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        isDismissible: false,
                                                        shape: const Border(
                                                          top: BorderSide(
                                                            color: Colors.grey,
                                                            width: 1,
                                                          ),
                                                          bottom:
                                                              BorderSide.none,
                                                          left: BorderSide.none,
                                                          right:
                                                              BorderSide.none,
                                                        ),
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return DraggableScrollableSheet(
                                                            expand: false,
                                                            initialChildSize:
                                                                0.4,
                                                            minChildSize: 0.2,
                                                            maxChildSize: 1,
                                                            builder: (context,
                                                                    scrollController) =>
                                                                SingleChildScrollView(
                                                              child: Column(
                                                                children: <
                                                                    Widget>[
                                                                  ListTile(
                                                                    title: const Text(
                                                                        'Seleccionar motivo de la cita'),
                                                                    trailing:
                                                                        IconButton(
                                                                      icon: const Icon(
                                                                          Icons
                                                                              .close),
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(context),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                    child: ListView
                                                                        .builder(
                                                                      controller:
                                                                          scrollController,
                                                                      shrinkWrap:
                                                                          true,
                                                                      itemCount:
                                                                          motivos
                                                                              .length,
                                                                      itemBuilder:
                                                                          (BuildContext context,
                                                                              int index) {
                                                                        return Row(
                                                                          children: [
                                                                            Text(
                                                                              motivos[index],
                                                                            ),
                                                                            Expanded(child: Container()),
                                                                            MaterialButton(
                                                                                elevation: 0,
                                                                                color: Colors.blue,
                                                                                onPressed: () {
                                                                                  setState(() {
                                                                                    motivoCita = motivos[index];
                                                                                    provider.setMotivo(motivos[index]);
                                                                                  });
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: const Text(
                                                                                  'Seleccionar',
                                                                                  style: TextStyle(color: Colors.white),
                                                                                )),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    color: Colors.blue,
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    child: const Text('Cambiar',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white))),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                )),
                            const SizedBox(height: 30),
                            const Text(
                                '¿Es tu primera visita con este especialista?  *'),
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile(
                                      value: true,
                                      groupValue: primeraVez,
                                      onChanged: (value) {
                                        setState(() {
                                          primeraVez = value as bool;
                                        });
                                      },
                                      title: const Text('Si')),
                                ),
                                Expanded(
                                  child: RadioListTile(
                                      value: false,
                                      groupValue: primeraVez,
                                      onChanged: (value) {
                                        setState(() {
                                          primeraVez = value as bool;
                                        });
                                      },
                                      title: const Text('No')),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    child: MaterialButton(
                                        color: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(2)),
                                        onPressed: () {
                                          provider.agendarCita(
                                              context, widget.doctor);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text('Agendar Cita',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            // SizedBox(width: 10),
                                            // Icon(Icons.arrow_forward_ios,
                                            //     color: Colors.white, size: 13)
                                          ],
                                        )),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
          },
        ));
  }
}
