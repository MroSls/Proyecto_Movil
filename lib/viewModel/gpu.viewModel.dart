import 'package:flutter/material.dart';
import '../data/services/gpu.service.dart';
import '../models/gpu.model.dart';

class GPUViewModel extends ChangeNotifier {
  final GpuService _service = GpuService();
  List<GPU> _GPUs = [];
  bool _isLoading = false;

  // Getters para obtener la lista de GPUs y el estado de carga
  List<GPU> get GPUs => _GPUs;
  bool get isLoading => _isLoading;

  // Método para obtener las GPUs
  Future<void> fetchGPUs() async {
    if (_GPUs.isNotEmpty) return; // Evita hacer la solicitud si ya hay datos

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
