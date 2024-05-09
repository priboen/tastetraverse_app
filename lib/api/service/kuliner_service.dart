class KulinerService {
  // final String baseUrl = "http://10.0.2.2:8000/api/";
  final String baseUrl = "http://127.0.0.1:8000/api/";
  // final String baseUrl = "http://192.168.1.45:8000/api/";
  final endpoint = "kuliner";

  Uri getUri(String path) {
    return Uri.parse("$baseUrl$path");
  }
}
