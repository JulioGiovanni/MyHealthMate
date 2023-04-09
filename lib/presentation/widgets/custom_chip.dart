import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/screens/agendar_cita.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const CustomChip({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      minWidth: 0,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      color: Colors.blue[50],
      elevation: 0,
      child:
          Text(label, style: TextStyle(color: Colors.blue[900], fontSize: 10)),
    );
  }
}
