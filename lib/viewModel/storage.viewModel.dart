import 'package:flutter/material.dart';
import '../data/services/storage.service.dart';
import '../models/storage.model.dart';

class StorageViewModel extends ChangeNotifier {
  final StorageService _service = StorageService();
  List<Storage> _storage = [];
  bool _isLoading = false;

  List<Storage> get storage => _storage;
  bool get isLoading => _isLoading;

  Future<void> fetchStorage() async {
    if (_storage.isNotEmpty) return;
    _isLoading = true;
    notifyListeners();

    try {
      _storage = await _service.fetchStorage();
    } catch (e) {
      throw Exception('Error al cargar las memorias de almacenamiento. $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}