import 'package:flutter/material.dart';
import 'package:myhealthmate/presentation/widgets/especialistas_card_busqueda.dart';

class SearchResultsScreen extends StatelessWidget {
  final List<dynamic> results;

  SearchResultsScreen({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados de la búsqueda'),
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return EspecialistasBusqueda(
            doctor: results[index],
          );
        },
      ),
    );
  }
}
