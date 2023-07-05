import 'package:http/http.dart' as http;

class ApiService {
  static Future<http.Response?> getAPi({required String url}) async {
    try {
      print('it is url ***********************');
      print(url);
      return await http.get(Uri.parse(url));
    } catch (e) {
      print(e);
      return null;
    }
  }
}
