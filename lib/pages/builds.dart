import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Para decodificar JSON
import '../models/assembledPC.dart';
import 'components.dart';

class Builds extends StatefulWidget {
  const Builds({super.key});

  @override
  _BuildsState createState() => _BuildsState();
}

class _BuildsState extends State<Builds> {
  double _minPrice = 5000;
  double _maxPrice = 100000;

  List<AssembledPC> _assembledPCs = [];

  @override
  void initState() {
    super.initState();
    _fetchAssembledPCs();
  }

  Future<void> _fetchAssembledPCs() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.56.1:3000/api/assembledPC'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>; // Decodifica la respuesta JSON como un mapa

        // Accede a la lista dentro del objeto JSON
        final assembledPCsData = data['assembledPCs'] as List<dynamic>;

        setState(() {
          _assembledPCs = assembledPCsData.map((item) => AssembledPC.fromJson(item as Map<String, dynamic>)).toList();
        });
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching assembled PCs: $e');
    }
  }

  void _showPriceRangeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.grey[850],
              title: const Text(
                'Select Price Range',
                style: TextStyle(color: Colors.white),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RangeSlider(
                    activeColor: Colors.white,
                    inactiveColor: Colors.white70,
                    values: RangeValues(_minPrice, _maxPrice),
                    min: 5000,
                    max: 100000,
                    divisions: (100000 - 5000) ~/ 1000,
                    labels: RangeLabels(
                      '\$${_minPrice.toStringAsFixed(0)}',
                      '\$${_maxPrice.toStringAsFixed(0)}',
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        _minPrice = values.start;
                        _maxPrice = values.end;
                      });
                    },
                  ),
                  Text(
                    'Min: \$${_minPrice.toStringAsFixed(0)} - Max: \$${_maxPrice.toStringAsFixed(0)}',
                    style: const TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _navigateToDetail(AssembledPC assembledPC) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Components(
          imagePath: assembledPC.urlImage.isNotEmpty ? assembledPC.urlImage[0] : '', // Mostrar la primera imagen de la lista
          title: assembledPC.namePC,
          description: assembledPC.software,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Builds',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: _assembledPCs.length,
        itemBuilder: (context, index) {
          final assembledPC = _assembledPCs[index];
          return GestureDetector(
            onTap: () => _navigateToDetail(assembledPC),
            child: Card(
              elevation: 5,
              color: Colors.grey[850],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.network(
                      assembledPC.urlImage.isNotEmpty ? assembledPC.urlImage[0] : '', // Mostrar la primera imagen de la lista
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          assembledPC.namePC,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          assembledPC.software,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 7, 6, 78),
        child: const Icon(
          Icons.monetization_on,
          color: Colors.white,
        ),
      ),
    );
  }
}
