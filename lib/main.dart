import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/providers/authentication_provider.dart';
import 'package:myhealthmate/presentation/screens/initial_screen.dart';
import 'package:myhealthmate/presentation/themes/color_themes.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => AuthenticationProvider(),
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctoralia',
      // themeMode: ThemeMode.dark,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const InitialScreen(),
    );
  }
}
