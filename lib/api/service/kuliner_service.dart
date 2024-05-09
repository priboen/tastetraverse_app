import 'dart:convert';

import 'package:http/http.dart' as http;

class KulinerService {
  // final String baseUrl = "http://10.0.2.2:8000/api/";
  final String baseUrl = "http://127.0.0.1:8000/api/";
  // final String baseUrl = "http://192.168.1.45:8000/api/";
  final endpoint = "kuliner";

  Uri getUri(String path) {
    return Uri.parse("$baseUrl$path");
  }

  Future<List<dynamic>> getKuliner() async {
    var response = await http.get(
        getUri(
          endpoint,
        ),
        headers: {
          "Accept": "application/json",
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResponse = json.decode(response.body);
      return decodedResponse['data'];
    } else {
      throw Exception('Tidak dapat mengambil data: ${response.reasonPhrase}');
    }
  }
}
