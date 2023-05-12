import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myhealthmate/presentation/models/doctor/doctor.dart';
import 'package:myhealthmate/presentation/models/doctor/especialidad.dart';
import 'package:myhealthmate/presentation/models/login/usuario.dart';
import 'package:myhealthmate/presentation/providers/auth.provider.dart';
import 'package:myhealthmate/presentation/providers/cita.provider.dart';
import 'package:myhealthmate/presentation/providers/data.provider.dart';
import 'package:myhealthmate/presentation/providers/search.provider.dart';
import 'package:myhealthmate/presentation/screens/initial_screen.dart';
import 'package:myhealthmate/presentation/themes/color_themes.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UsuarioAdapter());
  Hive.registerAdapter(DoctorAdapter());
  Hive.registerAdapter(EspecialidadAdapter());
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => AuthProvider()..verifyAuth()),
        ChangeNotifierProvider(
            create: (context) => DataProvider()
              ..getEspecialidades()
              ..getLast5Doctors()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => CitaProvider())
      ],
      child: const MyApp(),
    ),
  );
}

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
