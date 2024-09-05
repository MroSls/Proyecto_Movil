import 'package:flutter/material.dart';
import 'components.dart';

class Builds extends StatefulWidget {
  const Builds({super.key});

  @override
  _BuildsState createState() => _BuildsState();
}

class _BuildsState extends State<Builds> {
  double _minPrice = 5000;
  double _maxPrice = 100000;

  // Lista de tarjetas simuladas, que normalmente obtendrás desde el backend
  final List<Map<String, String>> _cards = [
    {
      'imagePath': 'assets/images/pcbuild.png',
      'title': 'PC Gamer armada',
      'description': 'El que lea esta descripcion puede ir directito a csm por pendejo',
    },
    // Puedes agregar más mapas aquí según sea necesario
  ];

  void _showPriceRangeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Select Price Range'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RangeSlider(
                    values: RangeValues(_minPrice, _maxPrice),
                    min: 5000,
                    max: 100000,
                    divisions: (100000 - 5000) ~/ 1000, // Total de divisiones
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
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Cierra el diálogo
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _navigateToDetail(Map<String, String> card) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Components(
          imagePath: card['imagePath']!,
          title: card['title']!,
          description: card['description']!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 6, 78),
        title: const Text(
          'Builds',
          style: TextStyle(
            color: Color.fromARGB(255, 0, 255, 213),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 255, 213)),
          onPressed: () {
            Navigator.pop(context); // Regresa a la pantalla anterior
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: _cards.length,
        itemBuilder: (context, index) {
          final card = _cards[index];
          return GestureDetector(
            onTap: () => _navigateToDetail(card),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.asset(
                      card['imagePath']!,
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
                          card['title']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          card['description']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
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
          color: Colors.white, // Color del icono
        ),
        onPressed: _showPriceRangeDialog,
      ),
    );
  }
}
