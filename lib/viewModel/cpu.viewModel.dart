import 'package:flutter/material.dart';
import '../data/services/cpu.service.dart';
import '../models/cpu.model.dart';

class CPUViewModel extends ChangeNotifier {
  final CpuService _service = CpuService();
  List<CPU> _CPUs = [];
  bool _isLoading = false;

  List<CPU> get CPUs => _CPUs;
  bool get isLoading => _isLoading;

  Future<void> fetchCPUs() async {
    if (_CPUs.isNotEmpty) return;
    _isLoading = true;
    notifyListeners();

    try {
      _CPUs = await _service.fetchCPUs();
    } catch (e) {
      throw Exception('Error al cargar los CPUs: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
