import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/constants/nav_items.dart';

// ignore: must_be_immutable
class BottomNavigation extends StatefulWidget {
  BottomNavigation({super.key, currentIndex});

  int currentIndex = 0;
  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: widget.currentIndex,
      onDestinationSelected: (value) =>
          setState(() => widget.currentIndex = value),
      destinations: navBarItems
          .map((e) => NavigationDestination(
                icon: Icon(e.icon, color: ThemeData().colorScheme.onPrimary),
                label: e.title,
              ))
          .toList(),
    );
  }
}
