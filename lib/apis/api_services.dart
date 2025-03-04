import 'package:http/http.dart' as http;

class ApiServices {
  final String apiUrl = 'https://www.simplifiedcoding.net/demos/marvel';

  Future<http.Response> fetchSuperheros() async {
    return await http.get(Uri.parse(apiUrl));
  }
}
