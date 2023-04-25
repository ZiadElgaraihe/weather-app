import 'package:weather_app/helpers/api.dart';
import 'package:weather_app/model/weather_model.dart';

class GetCurrentWeather {
  //get the current weather for any city -cairo as default- and return
  //it as a weatherModel
  Future<WeatherModel> getCurrentWeather(
      {String cityName = 'cairo'}) async {
    Map<String, dynamic> data =
        await Api().getFromApi(cityName: cityName, restOfUrl: 'weather');
    return WeatherModel.fromJson(data: data);
  }
}
