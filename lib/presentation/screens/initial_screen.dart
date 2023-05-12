import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/constants/nav_items.dart';
import 'package:myhealthmate/presentation/providers/auth.provider.dart';
import 'package:myhealthmate/presentation/widgets/citas.dart';
import 'package:myhealthmate/presentation/widgets/doctores/home_doctor.dart';
import 'package:myhealthmate/presentation/widgets/home.dart';
import 'package:myhealthmate/presentation/widgets/mensajes.dart';
import 'package:myhealthmate/presentation/widgets/perfil.dart';
import 'package:provider/provider.dart';

import '../widgets/authentication_widgets/no_login.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key, this.indexParameter}) : super(key: key);
  final int? indexParameter;
  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int _currentIndex = 0;
  int _currentIndexD = 0;
  final _pagesList = [
    const Home(),
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
  void initState() {
    super.initState();
    _currentIndex = widget.indexParameter ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: Drawer(
        //   child: ListView(),
        // ),
        appBar: AppBar(
          //Change the title of the app bar depending on the index
          title: Text(context.watch<AuthProvider>().isDoctor
              ? navBarItemsDoctor[_currentIndexD].title
              : navBarItems[_currentIndex].title),
        ),
        body: Consumer<AuthProvider>(
          builder: (context, provider, child) {
            return IndexedStack(
              index: _currentIndex != 0
                  ? provider.isAuth
                      ? provider.isDoctor
                          ? _currentIndexD
                          : _currentIndex
                      : 4
                  : 0,
              children: provider.isDoctor ? _pagesListDoctor : _pagesList,
            );
          },
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: context.watch<AuthProvider>().isDoctor
              ? _currentIndexD
              : _currentIndex,
          onDestinationSelected: (value) => setState(() {
            if (context.read<AuthProvider>().isDoctor) {
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
          destinations: context.watch<AuthProvider>().isDoctor
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
