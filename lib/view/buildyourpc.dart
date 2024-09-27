import 'package:flutter/material.dart';
import '../viewModel/cpu.viewModel.dart';
import '../viewModel/gpu.viewModel.dart';

class BuildYourPC extends StatefulWidget {
  const BuildYourPC({super.key});

  @override
  _BuildYourPCState createState() => _BuildYourPCState();
}

class _BuildYourPCState extends State<BuildYourPC> {
  double totalPrice = 0.0;
  final Map<String, Map<String, dynamic>?> activeItems = {};
  final CPUViewModel cpuViewModel = CPUViewModel();
  final GPUViewModel gpuViewModel = GPUViewModel();

  final List<String> categoriesList = [
    'CPU',
    'GPU',
    'Tarjeta Madre',
    'RAM',
    'Almacenamiento',
    'Fuente de Poder',
    'Refrigeración Líquida',
  ];

  List<Map<String, dynamic>> availableItems = [];

  @override
  void initState() {
    super.initState();
    fetchCPUs();
    fetchGPUs();
  }

  Future<void> fetchCPUs() async {
    await cpuViewModel.fetchCPUs();
    setState(() {
      availableItems.addAll(cpuViewModel.CPUs.map((cpu) {
        return {
          'name': cpu.name,
          'price': cpu.price,
          'category': 'CPU',
          'image': cpu.url_image,
        };
      }).toList());
    });
  }

  Future<void> fetchGPUs() async {
    try {
      await gpuViewModel.fetchGPUs();
      setState(() {
        availableItems.addAll(gpuViewModel.GPUs.map((gpu) {
          return {
            'name': gpu.name,
            'price': gpu.price,
            'category': 'GPU',
            'image': gpu.url_image,
          };
        }).toList());
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al cargar GPUs: $e')),
      );
    }
  }

  Map<String, List<Map<String, dynamic>>> get categories {
    final Map<String, List<Map<String, dynamic>>> catMap = {};

    for (var item in availableItems) {
      final category = item['category'];
      if (!catMap.containsKey(category)) {
        catMap[category] = [];
      }
      catMap[category]!.add(item);
    }

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
          Container(
            color: Colors.grey[850],
            padding: const EdgeInsets.all(16.0),
            margin: EdgeInsets.zero,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Stack(
              children: [
                DragTarget<Map<String, dynamic>>(
                  onAcceptWithDetails: (item) {
                    setState(() {
                      String category = item.data['category'];

                      if (activeItems.containsKey(category)) {
                        var previousItem = activeItems[category]!;
                        totalPrice -= double.parse(previousItem['price'].toString());
                        availableItems.add(previousItem);
                      }

                      activeItems[category] = item.data;
                      totalPrice += double.parse(item.data['price'].toString());
                      availableItems.removeWhere((availableItem) => availableItem['name'] == item.data['name']);
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
          Expanded(
            child: ListView(
              children: categoriesList.map((category) {
                List<Map<String, dynamic>> itemsInCategory = categories[category] ?? [];

                return Card(
                  color: Colors.grey[800],
                  child: ExpansionTile(
                    title: Text(
                      category,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    iconColor: Colors.yellowAccent,
                    expandedAlignment: Alignment.centerLeft,
                    initiallyExpanded: true, //False para que inicie colapsado
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.65,
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
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (item['image'] != null) 
                                      Image.network(
                                        item['image'],
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                          return Image.asset(
                                            'assets/images/componenteprueba.png',
                                            width: 80,
                                            height: 80,
                                            fit: BoxFit.cover,
                                          );
                                        },
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
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (item['image'] != null) 
                                    Image.network(
                                      item['image'],
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                        return Image.asset(
                                          'assets/images/componenteprueba.png',
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        );
                                      },
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
