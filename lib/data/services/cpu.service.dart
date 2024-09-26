import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_movil/data/auth/auth.dart';
import '../../models/cpu.model.dart';

class CpuService {
  final String endpoint = 'https://proyecto-movil-6fkk.onrender.com/api/cpu';
  final AuthToken authToken = AuthToken();

  Future<List<CPU>> fetchCPUs() async {
    String? token = await authToken.fetchToken();
    final response = await http.get(Uri.parse(endpoint), headers: {
      'Authorization': token ?? '',
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);

      if (responseJson['CPUs'] is List) {
        List<dynamic> data = responseJson['CPUs'];
        return data.map((item) => CPU.fromJson(item)).toList();
      } else {
        throw Exception('El campo "CPUs" no es una lista.');
      }
    } else {
      throw Exception('Error al cargar los CPUs: ${response.statusCode}');
    }
  }

  Future<CPU> getCPUById(String id) async {
    String? token = await authToken.fetchToken();
    final response = await http.get(Uri.parse('$endpoint/$id'), headers: {
      'Authorization': token ?? '',
    });

    if (response.statusCode == 200) {
      return CPU.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al cargar los CPUs: ${response.statusCode}');
    }
  }
}
