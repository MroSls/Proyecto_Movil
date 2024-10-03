import 'package:flutter/material.dart';
import 'package:proyecto_movil/viewModel/assembledPC.viewModel.dart';
import 'view/home.dart';
import 'view/assembledPC.view.dart';
import 'view/components.dart';
import 'view/buildyourpc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AssembledPCViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          '/assembledPC.view': (context) => const AssembledPCView(),
          '/components': (context) => const Components(
            title: '',
            componentDetails: [],
            url: '',
          ),
          '/buildyourpc': (context) => const BuildYourPC(),
        },
      ),
    );
  }
}