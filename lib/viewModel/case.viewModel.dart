import 'package:flutter/material.dart';
import '../data/services/case.service.dart';
import '../models/case.model.dart';

class CaseViewModel extends ChangeNotifier {
  final CaseService _service = CaseService();
  List<Case> _cases = [];
  bool _isLoading = false;

  List<Case> get cases => _cases;
  bool get isLoading => _isLoading;

  Future<void> fetchCases() async {
    if (_cases.isNotEmpty) return;
    _isLoading = true;
    notifyListeners();

    try {
      _cases = await _service.fetchCases();
    } catch (e) {
      throw Exception('Error al cargar los gabinetes: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}