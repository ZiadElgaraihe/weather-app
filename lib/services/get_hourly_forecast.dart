import 'package:weather_app/helpers/api.dart';
import 'package:weather_app/model/weather_model.dart';

class GetHourlyForecast {
  Future<List<WeatherModel>> getHourlyForecast(
      {String cityName = 'cairo'}) async {
    Map<String, dynamic> data =
        await Api().getFromApi(cityName: cityName, restOfUrl: 'forecast');
    List<WeatherModel> listOfForecast = [];
    for (int index = 0; index < 8; index++) {
      listOfForecast.add(WeatherModel.fromJsonList(data: data, index: index));
    }
    return listOfForecast;
  }
}
