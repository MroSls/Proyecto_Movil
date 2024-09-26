import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_movil/data/auth/auth.dart';
import '../../models/assembledPC.model.dart';

class AssembledPCService {
  final String endpoint = 'https://proyecto-movil-6fkk.onrender.com/api/assembledPC';
  final AuthToken authToken = AuthToken();

  Future<List<AssembledPC>> fetchAssembledPCs() async {
    String? token = await authToken.fetchToken();
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
      throw Exception('Error al cargar las PCs ensambladas: ${response.statusCode} => ${response.body}');
    }
  }
}