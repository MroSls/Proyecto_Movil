import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_movil/data/auth/auth.dart';
import '../../models/gpu.model.dart';

class GpuService {
  final String endpoint = 'https://proyecto-movil-6fkk.onrender.com/api/gpu';
  final AuthToken authToken = AuthToken();

  Future<List<GPU>> fetchGPUs() async {
    String? token = await authToken.fetchToken();
    final response = await http.get(Uri.parse(endpoint), headers: {
      'Authorization': token ?? '',
    });

    if (response.statusCode == 200) {
      final responseBody = response.body;

      final Map<String, dynamic> responseJson = jsonDecode(responseBody);
      // Asegúrate de que 'gpus' sea una lista
      List<dynamic> data = List<dynamic>.from(responseJson['gpus'] ?? []);
      return data.map((item) => GPU.fromJson(item)).toList();
    } else {
      throw Exception('Error al cargar los GPUs: ${response.statusCode}');
    }
  }

  Future<GPU> getGPUById(String id) async {
    String? token = await authToken.fetchToken();
    final response = await http.get(Uri.parse('$endpoint/$id'), headers: {
      'Authorization': token ?? '',
    });

    if (response.statusCode == 200) {
      return GPU.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al cargar los GPUs: ${response.statusCode}');
    }
  }
}
