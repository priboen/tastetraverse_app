import 'dart:convert';
import 'dart:io';

import 'package:tastetraverse_app/api/service/kuliner_service.dart';
import 'package:tastetraverse_app/app/data/kuliner.dart';

class KulinerController {
  final kulinerService = KulinerService();

  Future<List<Kuliner>> getKuliner() async {
    try {
      List<dynamic> kulinerData = await kulinerService.getKuliner();
      List<Kuliner> kuliner =
          kulinerData.map((json) => Kuliner.fromMap(json)).toList();
      return kuliner;
    } catch (e) {
      print(e);
      throw Exception('Gagal Mendapatkan data Kuliner');
    }
  }

  Future<Map<String, dynamic>> addKuliner(Kuliner kuliner, File? file) async {
    Map<String, String> data = {
      "nama": kuliner.nama,
      "jenis": kuliner.jenis,
      "harga": kuliner.harga.toString(),
      "tempat": kuliner.tempat,
      "gambar": kuliner.gambar
    };

    try {
      var response = await kulinerService.addKuliner(data, file);
      if (response.statusCode == 201) {
        return {
          'success': true,
          "message": "Data berhasil disimpan",
        };
      } else {
        if (response.headers['content-type']!.contains('application/json')) {
          var decodedJson = jsonDecode(response.body);
          return {
            'success': false,
            "message": decodedJson['message'] ?? 'Terjadi kesalahan',
          };
        }

        var decodedJson = jsonDecode(response.body);
        return {
          'success': false,
          'message':
              decodedJson['message'] ?? 'Terjadi kesalahan saat menyimpan data'
        };
      }
    } catch (e) {
      return {"success": false, "message": 'Terjadi kesalahan: $e'};
    }
  }

  Future<Map<String, dynamic>> updateKuliner(
      int id, Kuliner kuliner, File? file) async {
    Map<String, String> data = {
      "id": kuliner.id.toString(),
      "nama": kuliner.nama,
      "jenis": kuliner.jenis,
      "harga": kuliner.harga.toString(),
      "tempat": kuliner.tempat,
      "gambar": kuliner.gambar
    };

    try {
      var response = await kulinerService.updateKuliner(id, data, file);
      if (response.statusCode == 201) {
        return {
          'success': true,
          "message": "Data berhasil diubah",
        };
      } else {
        if (response.headers['content-type']!.contains('application/json')) {
          var decodedJson = jsonDecode(response.body);
          return {
            'success': false,
            "message": decodedJson['message'] ?? 'Terjadi kesalahan',
          };
        }

        var decodedJson = jsonDecode(response.body);
        return {
          'success': false,
          'message':
              decodedJson['message'] ?? 'Terjadi kesalahan saat mengubah data'
        };
      }
    } catch (e) {
      return {"success": false, "message": 'Terjadi kesalahan: $e'};
    }
  }

  Future<Map<String, dynamic>> deleteKuliner(int id) async {
    try {
      var response = await kulinerService.deleteKuliner(id);
      if (response.statusCode == 200) {
        return {
          'success': true,
          "message": "Data berhasil dihapus",
        };
      } else {
        if (response.headers['content-type']!.contains('application/json')) {
          var decodedJson = jsonDecode(response.body);
          return {
            'success': false,
            "message": decodedJson['message'] ?? 'Terjadi kesalahan',
          };
        }

        var decodedJson = jsonDecode(response.body);
        return {
          'success': false,
          'message':
              decodedJson['message'] ?? 'Terjadi kesalahan saat menghapus data'
        };
      }
    } catch (e) {
      return {"success": false, "message": 'Terjadi kesalahan: $e'};
    }
  }
}
