import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/constants/env_variables.dart';
import 'package:myhealthmate/presentation/providers/auth.provider.dart';
import 'package:myhealthmate/presentation/providers/cita.provider.dart';
import 'package:myhealthmate/presentation/screens/detalle_cita_screen.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:provider/provider.dart';

class HomeDoctor extends StatelessWidget {
  const HomeDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    print(context.watch<AuthProvider>().user);
    return Consumer<CitaProvider>(builder: (context, provider, child) {
      if (!context.watch<AuthProvider>().isAuth &&
          !context.watch<AuthProvider>().isDoctor) {
        return Center(child: CircularProgressIndicator());
      }
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
                Row(
                  children: [
                    Expanded(
                      child: Text('Próximas citas'.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          )),
                    ),
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  color: Colors.white,
                                  child: SfDateRangePicker(
                                    enableMultiView: true,
                                    viewSpacing: 20,
                                    headerStyle: DateRangePickerHeaderStyle(
                                      textAlign: TextAlign.center,
                                      textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    view: DateRangePickerView.month,
                                    selectionMode:
                                        DateRangePickerSelectionMode.range,
                                    showActionButtons: true,
                                    onSelectionChanged:
                                        (dateRangePickerSelectionChangedArgs) {
                                      provider.from =
                                          dateRangePickerSelectionChangedArgs
                                              .value.startDate
                                              .toString();
                                      provider.to =
                                          dateRangePickerSelectionChangedArgs
                                              .value.endDate
                                              .toString();
                                    },
                                    onSubmit: (value) {
                                      provider.isLoading = true;
                                      provider.getCitas().then((value) {
                                        provider.isLoading = false;
                                      });
                                      Navigator.pop(context);
                                    },
                                    onCancel: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                );
                              });
                        },
                        icon: Icon(Icons.filter_list_outlined))
                  ],
                ),
                provider.citas.isEmpty
                    ? Text('No hay citas')
                    : provider.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.separated(
                            itemCount: provider.citas.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 5,
                            ),
                            itemBuilder: (context, index) {
                              var urlImage =
                                  provider.citas[index].doctor!.foto!.isNotEmpty
                                      ? environment['supabaseUrl']! +
                                          provider.citas[index].doctor!.foto! +
                                          '?apikey=' +
                                          environment['token']!
                                      : null;
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DetalleCitaScreen(
                                          cita: provider.citas[index])));
                                },
                                child: Card(
                                  elevation: 0,
                                  child: Container(
                                    color: Colors.white,
                                    child: ListTile(
                                      title: Text(provider
                                          .citas[index].usuario!.nombre!),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(provider.citas[index].motivo!),
                                          Text(provider.citas[index].fecha!),
                                        ],
                                      ),
                                      trailing: CircleAvatar(
                                        radius: 20,
                                        backgroundImage: urlImage == null
                                            ? NetworkImage(
                                                'https://www.w3schools.com/howto/img_avatar.png')
                                            : NetworkImage(urlImage),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                const SizedBox(height: 10),
              ],
            ),
          ));
    });
  }
}
