import 'package:flutter/material.dart';
import '../data/services/psu.service.dart';
import '../models/psu.model.dart';

class PSUViewModel extends ChangeNotifier {
  final PsuService _service = PsuService();
  List<PSU> _PSUs = [];
  bool _isLoading = false;

  List<PSU> get PSUs => _PSUs;
  bool get isLoading => _isLoading;

  Future<void> fetchPSUs() async {
    if (_PSUs.isNotEmpty) return;
    _isLoading = true;
    notifyListeners();

    try {
      _PSUs = await _service.fetchPSUs();
    } catch (e) {
      throw Exception('Error al cargar los PSUs: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
