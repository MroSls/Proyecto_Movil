import 'package:flutter/material.dart';

class BuildYourPC extends StatefulWidget {
  const BuildYourPC({super.key});

  @override
  _BuildYourPCState createState() => _BuildYourPCState();
}

class _BuildYourPCState extends State<BuildYourPC> {
  double totalPrice = 0.0;
  final Map<String, Map<String, dynamic>?> activeItems = {}; // Para rastrear ítems activos por categoría

  // Definir las categorías iniciales
  final List<String> categoriesList = [
    'CPU',
    'GPU',
    'Tarjeta Madre',
    'RAM',
    'Almacenamiento',
    'Fuente de Poder',
    'Refrigeración Líquida',
  ];

  // Items disponibles para arrastrar
  final List<Map<String, dynamic>> availableItems = [
    {'name': 'CPU 1', 'price': '200', 'category': 'CPU', 'image': 'assets/images/componenteprueba.png'},
    {'name': 'CPU 1', 'price': '200', 'category': 'APU', 'image': 'assets/images/componenteprueba.png'},
    {'name': 'CPU 2', 'price': '250', 'category': 'CPU', 'image': 'assets/images/componenteprueba.png'},
    {'name': 'CPU 3', 'price': '500', 'category': 'CPU', 'image': 'assets/images/componenteprueba.png'},
    {'name': 'GPU 1', 'price': '500', 'category': 'GPU', 'image': 'assets/images/componenteprueba.png'},
    {'name': 'GPU 2', 'price': '600', 'category': 'GPU', 'image': 'assets/images/componenteprueba.png'},
    {'name': 'Motherboard 1', 'price': '150', 'category': 'Tarjeta Madre', 'image': 'assets/images/componenteprueba.png'},
    {'name': 'Motherboard 2', 'price': '200', 'category': 'Tarjeta Madre', 'image': 'assets/images/componenteprueba.png'},
    {'name': 'RAM 1', 'price': '80', 'category': 'RAM', 'image': 'assets/images/componenteprueba.png'},
    {'name': 'RAM 2', 'price': '120', 'category': 'RAM', 'image': 'assets/images/componenteprueba.png'},
    {'name': 'SSD 1TB', 'price': '100', 'category': 'Almacenamiento', 'image': 'assets/images/componenteprueba.png'},
    {'name': 'HDD 2TB', 'price': '80', 'category': 'Almacenamiento', 'image': 'assets/images/componenteprueba.png'},
    {'name': 'Power Supply 500W', 'price': '60', 'category': 'Fuente de Poder', 'image': 'assets/images/componenteprueba.png'},
    {'name': 'Power Supply 750W', 'price': '80', 'category': 'Fuente de Poder', 'image': 'assets/images/componenteprueba.png'},
    {'name': 'Cooler 1', 'price': '120', 'category': 'Refrigeración Líquida', 'image': 'assets/images/componenteprueba.png'},
    {'name': 'Cooler 2', 'price': '150', 'category': 'Refrigeración Líquida', 'image': 'assets/images/componenteprueba.png'},
  ];

  // Generar las categorías basadas en los ítems disponibles
  Map<String, List<Map<String, dynamic>>> get categories {
    final Map<String, List<Map<String, dynamic>>> catMap = {};

    for (var item in availableItems) {
      final category = item['category'];
      if (!catMap.containsKey(category)) {
        catMap[category] = [];
      }
      catMap[category]!.add(item);
    }
    
    // Asegurar que todas las categorías se muestren, incluso si están vacías
    for (var category in categoriesList) {
      if (!catMap.containsKey(category)) {
        catMap[category] = [];
      }
    }

    return catMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Build Your PC',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Contenedor para arrastrar y soltar
          Container(
            color: Colors.grey[850],
            padding: const EdgeInsets.all(16.0),
            margin: EdgeInsets.zero, // Eliminado el margen para evitar el marco blanco
            height: MediaQuery.of(context).size.height * 0.3,
            child: Stack(
              children: [
                DragTarget<Map<String, dynamic>>(
                  onAcceptWithDetails: (item) {
                    setState(() {
                      String category = item.data['category'];

                      // Restar el precio del ítem anterior, si existe
                      if (activeItems.containsKey(category)) {
                        var previousItem = activeItems[category]!;
                        totalPrice -= double.parse(previousItem['price']);
                        availableItems.add(previousItem);
                      }

                      // Agregar el nuevo ítem y sumar su precio
                      activeItems[category] = item.data as Map<String, dynamic>?;
                      totalPrice += double.parse(item.data['price']);
                      availableItems.remove(item);
                    });
                  },
                  builder: (context, candidateData, rejectedData) {
                    return Center(
                      child: Text(
                        activeItems.isNotEmpty
                            ? 'Item: ${activeItems.values.where((item) => item != null).map((item) => item!['name']).join(', ')}'
                            : 'Drop items here',
                        style: const TextStyle(fontSize: 18, color: Colors.white70),
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Total: \$${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Área para los dragitems
          Expanded(
            child: ListView(
              children: categoriesList.map((category) {
                List<Map<String, dynamic>> itemsInCategory = categories[category] ?? [];

                return Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.grey[800],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 300, // Aumentar la altura para permitir una mejor visualización de las tarjetas
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Número de columnas por categoría
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.75, // Ajusta la relación de aspecto de los ítems
                          ),
                          itemCount: itemsInCategory.length,
                          itemBuilder: (context, itemIndex) {
                            var item = itemsInCategory[itemIndex];
                            return Draggable<Map<String, dynamic>>(
                              data: item,
                              feedback: Material(
                                color: Colors.grey[800],
                                child: Card(
                                  color: Colors.grey[850],
                                  elevation: 4,
                                  margin: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (item['image'] != null) 
                                        Image.asset(
                                          item['image'] ?? 'assets/images/componenteprueba.png', // Imagen del componente
                                          width: 80, // Ancho de la imagen
                                          height: 80, // Alto de la imagen
                                          fit: BoxFit.cover, // Ajustar la imagen dentro del contenedor
                                        ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          item['name'] ?? 'No name',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '\$${item['price'] ?? '0'}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white60,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              child: Card(
                                color: Colors.grey[850],
                                elevation: 4,
                                margin: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (item['image'] != null) 
                                      Image.asset(
                                        item['image'] ?? 'assets/images/componenteprueba.png', // Imagen del componente
                                        width: 80, // Ancho de la imagen
                                        height: 80, // Alto de la imagen
                                        fit: BoxFit.cover, // Ajustar la imagen dentro del contenedor
                                      ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        item['name'] ?? 'No name',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '\$${item['price'] ?? '0'}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white60,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
