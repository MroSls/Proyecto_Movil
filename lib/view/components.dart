import 'package:flutter/material.dart';

class Components extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final List<Map<String, String>> componentDetails;

  const Components({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.componentDetails,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Regresa a la pantalla anterior
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: componentDetails.map((component) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10), // Espacio entre las etiquetas
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2), // Cambiar la posición de la sombra
                ),
              ],
            ),
            child: ExpansionTile(
              backgroundColor: Colors.grey[850],
              collapsedIconColor: Colors.white,
              iconColor: Colors.white,
              title: Text(
                component['label']!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    component['details']!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}