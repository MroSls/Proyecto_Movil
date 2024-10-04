import 'package:flutter/material.dart';
import '../data/services/assembledPC.service.dart';
import '../models/assembledPC.model.dart';

class AssembledPCViewModel extends ChangeNotifier {
  final AssembledPCService _service = AssembledPCService();
  List<AssembledPC> _assembledPCs = [];
  bool _isLoading = false;
  String _selectedCategory = '';

  List<AssembledPC> get assembledPCs => _assembledPCs;
  bool get isLoading => _isLoading;
  String get selectedCategory => _selectedCategory;

  List<AssembledPC> get filteredPCs {
    if (_selectedCategory.isEmpty) {
      return _assembledPCs;
    }
    return _assembledPCs
        .where((pc) => pc.category == _selectedCategory)
        .toList();
  }

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

  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
