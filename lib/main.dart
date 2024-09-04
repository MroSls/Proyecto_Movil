import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/builds.dart';
import 'pages/components.dart'; // Asegúrate de importar components.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/builds': (context) => const Builds(),
        '/components': (context) => const Components(
          imagePath: '',
          title: '',
          description: '',
        ),
      },
    );
  }
}
