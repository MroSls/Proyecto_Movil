import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_movil/data/auth/auth.dart';
import '../../models/motherboard.model.dart';

class MotherboardService {
  final String endpoint = 'https://proyecto-movil-6fkk.onrender.com/api/motherboard';
  final AuthToken authToken = AuthToken();

  Future<List<Motherboard>> fetchMotherboard() async {
    String? token = await authToken.fetchToken();
    final response = await http.get(
      Uri.parse(endpoint), 
      headers: {
      'Authorization': token ?? '',
    },
  );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);

      if (responseJson['cases'] is List) {
        List<dynamic> data = responseJson['cases'];
        return data.map((item) => Motherboard.fromJson(item)).toList();
      } else {
        throw Exception('El campo "cases" no es una lista.');
      }
    } else {
      throw Exception('Error al cargar los gabinetes. ${response.statusCode} => ${response.body}');
    }
  }
}