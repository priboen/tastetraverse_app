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
}
