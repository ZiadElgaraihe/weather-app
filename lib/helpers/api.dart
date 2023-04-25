import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<Map<String, dynamic>> getFromApi({
    //City you want to search for
    required String cityName,
    //restOfUrl depends on which services you use in the api
    required String restOfUrl,
  }) async {
    String baseUrl = 'https://api.openweathermap.org/data/2.5/';
    //Put your api key here
    String apiKey = '3c3c008fd28436214a235871b162d3ec';
    Uri url = Uri.parse('$baseUrl$restOfUrl?q=$cityName&appid=$apiKey');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      //If response is correct then decode it
      return jsonDecode(response.body);
    } else {
      //Throw exception if something went wrong
      throw Exception('The status code is equal to ${response.statusCode}');
    }
  }
}
