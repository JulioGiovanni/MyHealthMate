import 'dart:io';

import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';

class VerEnMapaButton extends StatelessWidget {
  const VerEnMapaButton({
    super.key,
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async => {
        if (Platform.isIOS)
          {
            await MapLauncher.showMarker(
              mapType: MapType.apple,
              coords: Coords(latitude, longitude),
              title: "Consultorio",
              description: "Pues Aqui",
            )
          }
        else
          {
            await MapLauncher.showMarker(
              mapType: MapType.google,
              coords: Coords(latitude, longitude),
              title: "Consultorio",
              description: "Pues Aqui",
            )
          }
      },
      child: Text('Abrir en Mapa'),
    );
  }
}
