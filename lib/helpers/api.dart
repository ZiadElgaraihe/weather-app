import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<Map<String, dynamic>> getFromApi({required String cityName, required String restOfUrl}) async {
    String baseUrl = 'https://api.openweathermap.org/data/2.5/';
    String apiKey = '3c3c008fd28436214a235871b162d3ec';
    Uri url = Uri.parse('$baseUrl$restOfUrl?q=$cityName&appid=$apiKey');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('The status code is equal to ${response.statusCode}');
    }
  }
}
