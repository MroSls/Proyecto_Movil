import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_movil/data/auth/auth.dart';
import '../../models/storage.model.dart';

class StorageService {
  final String endpoint = 'https://proyecto-movil-6fkk.onrender.com/api/storage';
  final AuthToken authToken = AuthToken();

  Future<List<Storage>> fetchStorage() async {
    String? token = await authToken.fetchToken();
    final response = await http.get(
      Uri.parse(endpoint),
      headers: {
        'Authorization': token ?? '',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);

      if (responseJson['storages'] is List) {
        List<dynamic> data = responseJson['storages'];
        return data.map((item) => Storage.fromJson(item)).toList();
      } else {
        throw Exception('El campo "storages" no es un alista.');
      }
    } else {
      throw Exception('Error al cargar las memorias de almacenamiento. ${response.statusCode} - ${response.body}');
    }
  }
}