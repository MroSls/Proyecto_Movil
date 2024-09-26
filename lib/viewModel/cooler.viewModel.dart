import 'package:flutter/material.dart';
import '../data/services/cooler.service.dart';
import '../models/cooler.model.dart';

class CoolerViewModel extends ChangeNotifier {
  final CoolerService _service = CoolerService();
  List<Cooler> _Coolers = [];
  bool _isLoading = false;

  List<Cooler> get Coolers => _Coolers;
  bool get isLoading => _isLoading;

  Future<void> fetchCoolers() async {
    if (_Coolers.isNotEmpty) return;
    _isLoading = true;
    notifyListeners();

    try {
      _Coolers = await _service.fetchCoolers();
    } catch (e) {
      throw Exception('Error al cargar los gabinetes: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
