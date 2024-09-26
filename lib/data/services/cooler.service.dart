import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_movil/data/auth/auth.dart';
import '../../models/cooler.model.dart';

class CoolerService {
  final String endpoint = 'https://proyecto-movil-6fkk.onrender.com/api/Cooler';
  final AuthToken authToken = AuthToken();

  Future<List<Cooler>> fetchCoolers() async {
    String? token = await authToken.fetchToken();
    final response = await http.get(Uri.parse(endpoint), headers: {
      'Authorization': token ?? '',
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseJson = jsonDecode(response.body);

      if (responseJson['Coolers'] is List) {
        List<dynamic> data = responseJson['Coolers'];
        return data.map((item) => Cooler.fromJson(item)).toList();
      } else {
        throw Exception('El campo "Coolers" no es una lista.');
      }
    } else {
      throw Exception('Error al cargar los gabinetes: ${response.statusCode}');
    }
  }

  Future<Cooler> getCoolerById(String id) async {
    String? token = await authToken.fetchToken();
    final response = await http.get(Uri.parse('$endpoint/$id'), headers: {
      'Authorization': token ?? '',
    });

    if (response.statusCode == 200) {
      return Cooler.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al cargar los gabinetes: ${response.statusCode}');
    }
  }
}
