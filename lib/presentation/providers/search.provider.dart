import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthmate/presentation/constants/env_variables.dart';
import 'package:myhealthmate/presentation/models/doctor/doctor.dart';
import 'package:myhealthmate/presentation/screens/search_results_screen.dart';

class SearchProvider with ChangeNotifier {
  searchDoctorByCategory(id, context) async {
    var response = await http.get(
      Uri.parse(environment['apiUrl']! + 'doctores/especialidad/$id'),
    );

    if (response.statusCode == 200) {
      var results = jsonDecode(response.body)
          .map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SearchResultsScreen(results: results),
        ),
      );
      return results;
    } else {
      throw Exception('Error al buscar: ${response.reasonPhrase}');
    }
  }

  search(String query, context) async {
    var response = await http.get(
      Uri.parse(environment['apiUrl']! + 'doctores/search?nombre=$query'),
    );

    if (response.statusCode == 200) {
      var results = jsonDecode(response.body)
          .map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SearchResultsScreen(results: results),
        ),
      );
    } else {
      throw Exception('Error al buscar: ${response.reasonPhrase}');
    }
  }
}
