import 'package:flutter/material.dart';
import '../data/services/gpu.service.dart';
import '../models/gpu.model.dart';

class GPUViewModel extends ChangeNotifier {
  final GpuService _service = GpuService();
  List<GPU> _GPUs = [];
  bool _isLoading = false;

  List<GPU> get GPUs => _GPUs;
  bool get isLoading => _isLoading;

  Future<void> fetchGPUs() async {
    if (_GPUs.isNotEmpty) return;
    _isLoading = true;
    notifyListeners();

    try {
      _GPUs = await _service.fetchGPUs();
    } catch (e) {
      throw Exception('Error al cargar los GPUs: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
