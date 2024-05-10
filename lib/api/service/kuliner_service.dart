import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class KulinerService {
  // final String baseUrl = "http://10.0.2.2:8000/api/";
  // final String baseUrl = "http://127.0.0.1:8000/api/";
  final String baseUrl = "http://192.168.1.7:8000/api/";
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

  Future<http.Response> addKuliner(Map<String, String> data, File? file) async {
    var request = http.MultipartRequest(
      'POST',
      getUri(endpoint),
    )
      ..fields.addAll(data)
      ..headers['Content-Type'] = 'application/json';

    if (file != null) {
      request.files.add(await http.MultipartFile.fromPath('gambar', file.path));
    } else {
      request.files.add(http.MultipartFile.fromString('gambar', ''));
    }

    return await http.Response.fromStream(await request.send());
  }

  Future<http.Response> updateKuliner(
      int id, Map<String, String> data, File? file) async {
    var request = http.MultipartRequest(
      'POST',
      getUri('$endpoint/$id'),
    )
      ..fields.addAll(data)
      ..headers['Content-Type'] = 'application/json';

    if (file != null) {
      request.files.add(await http.MultipartFile.fromPath('gambar', file.path));
    } else {
      request.files.add(http.MultipartFile.fromString('gambar', ''));
    }

    return await http.Response.fromStream(await request.send());
  }

  Future<http.Response> deleteKuliner(int id) async {
    var response = await http.delete(
      getUri('$endpoint/$id'),
      headers: {
        "Accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to delete data: ${response.reasonPhrase}');
    }
  }
}
