import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_movil/data/auth/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/assembledPC.model.dart';

class AssembledPCService {
  final String endpoint = 'https://proyecto-movil-6fkk.onrender.com/api/assembledPC';
  final AuthService authService = AuthService();

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  Future<List<AssembledPC>> fetchAssembledPCs() async {
    final token = await _getToken();
    final response = await http.get(
      Uri.parse(endpoint),
      headers: {
        'Authorization': token ?? '',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);

      if (responseJson['assembledPCs'] is List) {
        List<dynamic> data = responseJson['assembledPCs'];
        return data.map((item) => AssembledPC.fromJson(item)).toList();
      } else {
        throw Exception('El campo "assembledPCs" no es una lista.');
      }
    } else {
      throw Exception(
          'Error al cargar las PCs ensambladas: ${response.statusCode}');
    }
  }

  Future<AssembledPC> getAssembledPCById(String id) async {
    final token = await _getToken();
    final response = await http.get(
      Uri.parse('$endpoint/$id'),
      headers: {
        'Authorization': '$token',
      },
    );

    if (response.statusCode == 200) {
      return AssembledPC.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al cargar la PC: ${response.statusCode}');
    }
  }
}
