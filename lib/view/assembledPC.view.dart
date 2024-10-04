import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/assembledPC.model.dart';
import '../viewModel/assembledPC.viewModel.dart';
import 'components.dart';

class AssembledPCView extends StatefulWidget {
  const AssembledPCView({super.key});

  @override
  AssembledPCViewState createState() => AssembledPCViewState();
}

class AssembledPCViewState extends State<AssembledPCView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel =
          Provider.of<AssembledPCViewModel>(context, listen: false);
      if (viewModel.assembledPCs.isEmpty && !viewModel.isLoading) {
        viewModel.fetchAssembledPCs();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AssembledPCViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: textCustom('Builds', 40, FontWeight.bold, Colors.white),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, size: 30),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Consumer<AssembledPCViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.filteredPCs.isEmpty) {
            return const Center(
                child: Text('No hay PCs ensambladas disponibles'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: viewModel.filteredPCs.length,
            itemBuilder: (context, index) {
              final assembledPC = viewModel.filteredPCs[index];

              return GestureDetector(
                onTap: () => _navigateToDetail(assembledPC),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: Colors.blueGrey, width: 2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10)),
                            child: CarouselSlider(
                              items: assembledPC.urlImage.isNotEmpty
                                  ? assembledPC.urlImage.map((image) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return Image.network(
                                            image,
                                            width: double.infinity,
                                            height: 400,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      );
                                    }).toList()
                                  : [],
                              options: CarouselOptions(
                                height: 400,
                                aspectRatio: 16 / 9,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 5),
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 1000),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                enlargeFactor: 2.0,
                                scrollDirection: Axis.horizontal,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textCustom(assembledPC.namePC, 18,
                                      FontWeight.bold, Colors.blueGrey),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      textCustom(assembledPC.software, 18,
                                          FontWeight.bold, Colors.grey),
                                      Spacer(),
                                      textCustom(
                                          '\$${assembledPC.price.toDouble()} mxn',
                                          26,
                                          FontWeight.bold,
                                          Colors.blueGrey),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Text textCustom(String text, int size, FontWeight fontWeight, Color color) {
    return Text(
      text,
      style: TextStyle(
          fontSize: size.toDouble(), fontWeight: fontWeight, color: color),
    );
  }

  void _navigateToDetail(AssembledPC assembledPC) {
    final List<Map<String, String>> componentDetails = [
      {
        'label': 'Wifi',
        'details': assembledPC.wifi
            ? 'Cuenta con antena WiFi'
            : 'No cuenta con antena WiFi'
      },
      {'label': 'Color', 'details': assembledPC.color},
      {
        'label': 'Almacenamiento',
        'details':
            '- ${assembledPC.storageMedia.totalStorageCapacity} \n- Cuenta con ${assembledPC.storageMedia.storageUnitsInstalled} ${(int.parse(assembledPC.storageMedia.storageUnitsInstalled) < 2) ? 'unidad' : 'unidades'} de almacenamiento ${assembledPC.storageMedia.storageUnit}'
      },
      {
        'label': 'RAM',
        'details':
            '${assembledPC.memory.memoryRam} a una velocidad de ${assembledPC.memory.memoryVelocity}'
      },
      {'label': 'Fuente de Poder', 'details': assembledPC.powerSuppy},
      {'label': 'Sistema Operativo', 'details': assembledPC.software},
      {
        'label': 'CPU',
        'details':
            'Tiene un procesador ${assembledPC.cpu.cpuFamily} ${assembledPC.cpu.cpuModel} de ${assembledPC.cpu.cpuCores} nucleos con ${assembledPC.cpu.cpu} de frecuencia hasta un maximo de ${assembledPC.cpu.cpuTurboFrecuency}'
      },
      {
        'label': 'GPU',
        'details':
            'Tiene una tarjeta ${assembledPC.gpu.gpuName} modelo ${assembledPC.gpu.gpuDiscreteModel}'
      },
    ];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Components(
          title: assembledPC.namePC,
          componentDetails: componentDetails,
          url: assembledPC.url,
        ),
      ),
    );
  }
}
