import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/constants/nav_items.dart';
import 'package:myhealthmate/presentation/widgets/citas.dart';
import 'package:myhealthmate/presentation/widgets/especialistas_card_busqueda.dart';
import 'package:myhealthmate/presentation/widgets/home.dart';
import 'package:myhealthmate/presentation/widgets/mensajes.dart';
import 'package:myhealthmate/presentation/widgets/perfil.dart';

//TODO: Make the index change with state manager and make the screen a stateless widget
class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int _currentIndex = 0;
  // const Home(),
  final _pagesList = [
    const EspecialistasBusqueda(),
    const Citas(),
    const Mensajes(),
    const Perfil()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: Drawer(
        //   child: ListView(),
        // ),
        appBar: AppBar(
          //Change the title of the app bar depending on the index
          title: Text(navBarItems[_currentIndex].title),
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: _pagesList,
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: (value) =>
              setState(() => _currentIndex = value),
          destinations: navBarItems
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