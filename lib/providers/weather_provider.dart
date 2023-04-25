import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  List<WeatherModel> _listOfWeatherModels = [];
  WeatherModel? _weatherModel;

  set weatherModel(WeatherModel weatherModel) {
    _weatherModel = weatherModel;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  WeatherModel get weatherModel {
    return _weatherModel!;
  }

  set listOfWeatherModels(List<WeatherModel> listOfWeatherModels) {
    _listOfWeatherModels = listOfWeatherModels;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  List<WeatherModel> get listOfWeatherModels {
    return _listOfWeatherModels;
  }
}
