import 'package:weather_app/helpers/api.dart';
import 'package:weather_app/model/weather_model.dart';

class GetHourlyForecast {
  //Display the weather every 3 hours for 8 times
  //The api display up to 30 times but i use 8 only
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
