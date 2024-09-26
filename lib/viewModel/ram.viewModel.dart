import 'package:flutter/material.dart';
import '../data/services/ram.service.dart';
import '../models/ram.modl.dart';

class RAMViewModel extends ChangeNotifier {
  final RAMService _service = RAMService();
  List<RAM> _ram = [];
  bool _isLoading = false;

  List<RAM> get ram => _ram;
  bool get isLoading => _isLoading;

  Future<void> fetchRAM() async {
    if (_ram.isNotEmpty) return;
    _isLoading = true;
    notifyListeners();

    try {
      _ram = await _service.fetchRAM();
    } catch (e) {
      throw Exception('Error al cargar las memorias ram. $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
