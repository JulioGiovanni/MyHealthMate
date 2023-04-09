import 'package:flutter/material.dart';

class AgendarCitaScreen extends StatefulWidget {
  const AgendarCitaScreen({Key? key}) : super(key: key);

  @override
  State<AgendarCitaScreen> createState() => _AgendarCitaScreenState();
}

class _AgendarCitaScreenState extends State<AgendarCitaScreen> {
  String motivoCita = 'Consulta';
  bool primeraVez = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Agendar Cita'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.grey[100],
              child: Column(
                children: [
                  Row(
                    children: [
                      const Image(
                        image: NetworkImage('https://picsum.photos/200'),
                        width: 30,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Dr. Juan Perez',
                              style: TextStyle(fontSize: 16)),
                          Text('Especialista',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[600])),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month_rounded, size: 18),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Fecha y hora'),
                          const Text('Zona horaria'),
                          InkWell(
                            splashColor: Colors.blueAccent,
                            highlightColor: Colors.blue,
                            onTap: () {
                              //Mostrar alerta
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Nueva fecha'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            children: const [
                                              Text('Fecha: '),
                                              Text('dd/mm/aaaa')
                                            ],
                                          ),
                                          Row(
                                            children: const [
                                              Text('Hora: '),
                                              Text('hh:mm')
                                            ],
                                          ),
                                          Row(
                                            children: const [
                                              Text('Zona horaria: '),
                                              Text('Zona horaria')
                                            ],
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            //Cerrar alerta
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            //Cerrar alerta
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Aceptar'),
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: const Text(
                              "Cambiar de fecha",
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
                    children: const [
                      Icon(Icons.location_on),
                      SizedBox(width: 20),
                      Text('Ubicación del consultorio'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Datos relacionados a la cita',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Text('Motivo de la cita  *',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  Card(
                      elevation: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(0),
                            color: Colors.white),
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                              isScrollControlled: true,
                                              isDismissible: false,
                                              shape: const Border(
                                                top: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1,
                                                ),
                                                bottom: BorderSide.none,
                                                left: BorderSide.none,
                                                right: BorderSide.none,
                                              ),
                                              context: context,
                                              builder: (BuildContext context) {
                                                return DraggableScrollableSheet(
                                                  expand: false,
                                                  initialChildSize: 0.4,
                                                  minChildSize: 0.2,
                                                  maxChildSize: 1,
                                                  builder: (context,
                                                          scrollController) =>
                                                      Column(
                                                    children: <Widget>[
                                                      ListTile(
                                                        title: const Text(
                                                            'Seleccionar motivo de la cita'),
                                                        trailing: IconButton(
                                                          icon: const Icon(
                                                              Icons.close),
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  context),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          child: Column(
                                                            children: [
                                                              ListView.builder(
                                                                controller:
                                                                    scrollController,
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount: 20,
                                                                itemBuilder:
                                                                    (BuildContext
                                                                            context,
                                                                        int index) {
                                                                  return Row(
                                                                    children: [
                                                                      Text(
                                                                          'Motivo de la cita $index'),
                                                                      Expanded(
                                                                          child:
                                                                              Container()),
                                                                      MaterialButton(
                                                                          elevation:
                                                                              0,
                                                                          color: Colors
                                                                              .blue,
                                                                          onPressed:
                                                                              () {
                                                                            setState(() {
                                                                              motivoCita = 'Motivo de la cita $index';
                                                                            });
                                                                            Navigator.pop(context);
                                                                          },
                                                                          child:
                                                                              const Text(
                                                                            'Seleccionar',
                                                                            style:
                                                                                TextStyle(color: Colors.white),
                                                                          )),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          color: Colors.blue,
                                          padding: const EdgeInsets.all(0),
                                          child: const Text('Cambiar',
                                              style: TextStyle(
                                                  color: Colors.white))),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      )),
                  const SizedBox(height: 30),
                  const Text('¿Es tu primera visita con este especialista?  *'),
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
                                  borderRadius: BorderRadius.circular(2)),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('Continuar',
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(width: 10),
                                  Icon(Icons.arrow_forward_ios,
                                      color: Colors.white, size: 13)
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
        ));
  }
}
