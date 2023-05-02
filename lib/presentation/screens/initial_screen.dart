import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/constants/nav_items.dart';
import 'package:myhealthmate/presentation/providers/authentication_provider.dart';
import 'package:myhealthmate/presentation/widgets/citas.dart';
import 'package:myhealthmate/presentation/widgets/doctores/home_doctor.dart';
import 'package:myhealthmate/presentation/widgets/especialistas_card_busqueda.dart';
import 'package:myhealthmate/presentation/widgets/mensajes.dart';
import 'package:myhealthmate/presentation/widgets/perfil.dart';
import 'package:provider/provider.dart';

import '../widgets/authentication_widgets/no_login.dart';

//TODO: Make the index change with state manager and make the screen a stateless widget
class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int _currentIndex = 0;
  int _currentIndexD = 0;
  // const Home(),
  final _pagesList = [
    const EspecialistasBusqueda(),
    const Citas(),
    const Mensajes(),
    const Perfil(),
    const NoLogin(),
  ];
  final _pagesListDoctor = [
    const HomeDoctor(),
    const Mensajes(),
    const Perfil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: Drawer(
        //   child: ListView(),
        // ),
        appBar: AppBar(
          //Change the title of the app bar depending on the index
          title: Text(context.watch<AuthenticationProvider>().isADoctor
              ? navBarItemsDoctor[_currentIndexD].title
              : navBarItems[_currentIndex].title),
        ),
        body: IndexedStack(
          index: context.watch<AuthenticationProvider>().loggedIn
              ? (context.watch<AuthenticationProvider>().isADoctor
                  ? _currentIndexD
                  : _currentIndex)
              : 4,
          children: context.watch<AuthenticationProvider>().isADoctor
              ? _pagesListDoctor
              : _pagesList,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: context.watch<AuthenticationProvider>().isADoctor
              ? _currentIndexD
              : _currentIndex,
          onDestinationSelected: (value) => setState(() {
            if (context.read<AuthenticationProvider>().isADoctor) {
              _currentIndexD = value;
              _currentIndex = value + 1;
            } else {
              _currentIndex = value;
              if (value == 0)
                _currentIndexD = value;
              else
                _currentIndexD = value - 1;
            }
          }),
          destinations: context.watch<AuthenticationProvider>().isADoctor
              ? navBarItemsDoctor
                  .map((e) => NavigationDestination(
                        icon: Icon(
                          e.icon,
                          // color: ThemeData().colorScheme.secondaryContainer,
                        ),
                        label: e.title,
                      ))
                  .toList()
              : navBarItems
                  .map((e) => NavigationDestination(
                        icon: Icon(
                          e.icon,
                          // color: ThemeData().colorScheme.secondaryContainer,
                        ),
                        label: e.title,
                      ))
                  .toList(),
        ));
  }
}
