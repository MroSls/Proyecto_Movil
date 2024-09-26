import 'package:flutter/material.dart';
import '../data/services/motherboard.service.dart';
import '../models/motherboard.model.dart';

class MotherboardViewModel extends ChangeNotifier {
  final MotherboardService _service = MotherboardService();
  List<Motherboard> _motherBoards = [];
  bool _isLoading = false;

  List<Motherboard> get motherBoards => _motherBoards;
  bool get isLoading => _isLoading;

  Future<void> fetchMotherBoards() async {
    if (_motherBoards.isNotEmpty) return;
    _isLoading = true;
    notifyListeners();

    try {
      _motherBoards = await _service.fetchMotherboard();
    } catch (e) {
      throw Exception('Error al cargar las tarjetas madres. $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}