import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_movil/data/auth/auth.dart';
import '../../models/ram.modl.dart';

class RAMService {
  final String endpoint = 'https://proyecto-movil-6fkk.onrender.com/api/ram';
  final AuthToken authToken = AuthToken();

  Future<List<RAM>> fetchRAM() async {
    String? token = await authToken.fetchToken();
    final response = await http.get(
      Uri.parse(endpoint),
      headers: {
        'Authorization': token ?? '',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);

      if (responseJson['rams'] is List) {
        List<dynamic> data = responseJson['rams'];
        return data.map((item) => RAM.fromJson(item)).toList();
      } else {
        throw Exception('El campo "rams" no es una lista.');
      }
    } else {
      throw Exception('Erro al cargar las rams. ${response.statusCode} - ${response.body}');
    }
  }
}