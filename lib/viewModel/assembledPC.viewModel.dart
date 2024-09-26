import 'package:flutter/material.dart';
import '../data/services/assembledPC.service.dart';
import '../models/assembledPC.model.dart';

class AssembledPCViewModel extends ChangeNotifier {
  final AssembledPCService _service = AssembledPCService();
  List<AssembledPC> _assembledPCs = [];
  bool _isLoading = false;

  List<AssembledPC> get assembledPCs => _assembledPCs;
  bool get isLoading => _isLoading;

  Future<void> fetchAssembledPCs() async {
    if (_assembledPCs.isNotEmpty) return;
    _isLoading = true;
    notifyListeners();

    try {
      _assembledPCs = await _service.fetchAssembledPCs();
    } catch (e) {
      throw Exception('Error al cargar las PCs: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}