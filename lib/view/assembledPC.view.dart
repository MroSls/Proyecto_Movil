import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final viewModel = AssembledPCViewModel();
        viewModel.fetchAssembledPCs();
        return viewModel;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Builds',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Consumer<AssembledPCViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (viewModel.assembledPCs.isEmpty) {
              return const Center(child: Text('No hay PCs ensambladas disponibles'));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: viewModel.assembledPCs.length,
              itemBuilder: (context, index) {
                final assembledPC = viewModel.assembledPCs[index];
                
                return GestureDetector(
                  onTap: () => _navigateToDetail(assembledPC),
                  child: Card(
                    elevation: 5,
                    color: Colors.grey[850], // contenedor texto pc
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.vertical(top: Radius.circular(10)),
                          child: Image.network(
                            assembledPC.urlImage.isNotEmpty ? assembledPC.urlImage[0] : '',
                            width: double.infinity,
                            height: 400,
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
                              const SizedBox(height: 10),
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
            );
          },
        ),
      ),
    );
  }

  void _navigateToDetail(AssembledPC assembledPC) {

    final List<Map<String, String>> componentDetails = [
      {'label': 'Wifi', 'details': assembledPC.wifi ? 'Cuenta con antena WiFi' : 'No cuenta con antena WiFi'},
      {'label': 'Color', 'details': assembledPC.color},
      {'label': 'Almacenamiento', 'details': '- ${assembledPC.storageMedia.totalStorageCapacity} \n- Cuenta con ${assembledPC.storageMedia.storageUnitsInstalled} ${(int.parse(assembledPC.storageMedia.storageUnitsInstalled) < 2) ? 'unidad' : 'unidades'} de almacenamiento ${assembledPC.storageMedia.storageUnit}'},
      {'label': 'RAM', 'details': '${assembledPC.memory.memoryRam} a una velocidad de ${assembledPC.memory.memoryVelocity}'},
      {'label': 'Fuente de Poder', 'details': assembledPC.powerSuppy},
      {'label': 'Sistema Operativo', 'details': assembledPC.software},
      {'label': 'CPU', 'details': 'Tiene un procesador ${assembledPC.cpu.cpuFamily} ${assembledPC.cpu.cpuModel} de ${assembledPC.cpu.cpuCores} nucleos con ${assembledPC.cpu.cpu} de frecuencia hasta un maximo de ${assembledPC.cpu.cpuTurboFrecuency}'},
      {'label': 'GPU', 'details': 'Tiene una tarjeta ${assembledPC.gpu.gpuName} modelo ${assembledPC.gpu.gpuDiscreteModel}'},
    ];
  
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Components(
          imagePath: assembledPC.urlImage.isNotEmpty ? assembledPC.urlImage[0] : '',
          title: assembledPC.namePC,
          description: assembledPC.software,
          componentDetails: componentDetails,
        ),
      ),
    );
  }
}