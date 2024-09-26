import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_movil/data/auth/auth.dart';
import '../../models/psu.model.dart';

class PsuService {
  final String endpoint = 'https://proyecto-movil-6fkk.onrender.com/api/psu';
  final AuthToken authToken = AuthToken();

  Future<List<PSU>> fetchPSUs() async {
    String? token = await authToken.fetchToken();
    final response = await http.get(Uri.parse(endpoint), headers: {
      'Authorization': token ?? '',
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);

      if (responseJson['PSUs'] is List) {
        List<dynamic> data = responseJson['PSUs'];
        return data.map((item) => PSU.fromJson(item)).toList();
      } else {
        throw Exception('El campo "PSUs" no es una lista.');
      }
    } else {
      throw Exception('Error al cargar los PSUs: ${response.statusCode}');
    }
  }

  Future<PSU> getPSUById(String id) async {
    String? token = await authToken.fetchToken();
    final response = await http.get(Uri.parse('$endpoint/$id'), headers: {
      'Authorization': token ?? '',
    });

    if (response.statusCode == 200) {
      return PSU.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al cargar los PSUs: ${response.statusCode}');
    }
  }
}
