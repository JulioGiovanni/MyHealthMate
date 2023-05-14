import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/constants/env_variables.dart';
import 'package:myhealthmate/presentation/providers/auth.provider.dart';
import 'package:myhealthmate/presentation/providers/data.provider.dart';
import 'package:myhealthmate/presentation/screens/chat_screen.dart';
import 'package:provider/provider.dart';

class Mensajes extends StatefulWidget {
  const Mensajes({super.key});

  @override
  State<Mensajes> createState() => _MensajesState();
}

class _MensajesState extends State<Mensajes> {
  @override
  void initState() {
    super.initState();
    DataProvider dataProvider = DataProvider();
    dataProvider.getConversations();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, provider, child) {
      return context.watch<AuthProvider>().isDoctor
          ? RefreshIndicator(
              onRefresh: () => provider.getConversations(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Mensajes',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
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
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ChatScreen(
                                            id1: provider.conversations[index]
                                                .participant1!.id!,
                                            id2: provider.conversations[index]
                                                .participant2!.id!,
                                            nombre: provider
                                                .conversations[index]
                                                .participant1!
                                                .nombre!,
                                          )));
                                },
                                child: Card(
                                  elevation: 0,
                                  child: Container(
                                    color: Colors.white,
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 20,
                                        backgroundImage: provider
                                                    .conversations[index]
                                                    .participant1
                                                    ?.foto !=
                                                null
                                            ? NetworkImage(
                                                environment['supabaseUrl']! +
                                                    provider
                                                        .conversations[index]
                                                        .participant1!
                                                        .foto! +
                                                    '?apikey=' +
                                                    environment['token']!)
                                            : NetworkImage(
                                                'https://www.w3schools.com/howto/img_avatar.png'),
                                      ),
                                      title: Text(provider.conversations[index]
                                          .participant1!.nombre!),
                                      // subtitle: Text('Mensaje'),
                                      // trailing: Text(),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: provider.conversations.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics())
                      ]),
                ),
              ),
            )
          : RefreshIndicator(
              onRefresh: () => provider.getConversations(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Mensajes',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
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
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ChatScreen(
                                          id1: provider.conversations[index]
                                              .participant1!.id!,
                                          id2: provider.conversations[index]
                                              .participant2!.id!,
                                          nombre: provider.conversations[index]
                                              .participant2!.nombre!)));
                                },
                                child: Card(
                                  elevation: 0,
                                  child: Container(
                                    color: Colors.white,
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 20,
                                        backgroundImage: provider
                                                    .conversations[index]
                                                    .participant2
                                                    ?.foto !=
                                                null
                                            ? NetworkImage(
                                                environment['supabaseUrl']! +
                                                    provider
                                                        .conversations[index]
                                                        .participant2!
                                                        .foto! +
                                                    '?apikey=' +
                                                    environment['token']!)
                                            : NetworkImage(
                                                'https://www.w3schools.com/howto/img_avatar.png'),
                                      ),
                                      title: Text(provider.conversations[index]
                                          .participant2!.nombre!),
                                      // subtitle: Text('Mensaje'),
                                      // trailing: Text('Fecha'),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: provider.conversations.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics())
                      ]),
                ),
              ),
            );
    });
  }
}
