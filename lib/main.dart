import 'package:flutter/material.dart';
import 'package:proyecto_movil/models/assembledPC.model.dart';
import 'view/home.dart';
import 'view/builds.dart';
import 'view/components.dart';
import 'view/buildyourpc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
// Inicializar en initState
  }

  Future<List<AssembledPC>> _getAssembledPCs() async {
    final response = await http.get(Uri.parse("http://192.168.56.1:3000/api/assembledPC"));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      if (jsonResponse.containsKey('assembledPCs')) {
        List<dynamic> pcList = jsonResponse['assembledPCs'];
        List<AssembledPC> assembledPCs = pcList.map((pc) => AssembledPC.fromJson(pc)).toList();
        for (var pc in pcList) {
          print(pc);
        }
        return assembledPCs;
        // return pcList.map((pc) => AssembledPC.fromJson(pc)).toList();
      } else {
        throw Exception("Clave 'assembledPCs' no encontrada en la respuesta.");
      }
    } else {
      throw Exception("Fallo la conexion");
    }
  }

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
        '/buildyourpc': (context) => const BuildYourPC(),
      },
    );
  }
}