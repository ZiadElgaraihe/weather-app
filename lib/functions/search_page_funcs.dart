import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/services/get_hourly_forecast.dart';
import 'package:weather_app/widgets/snackbars/custom_snack_bar.dart';
import '../model/weather_model.dart';
import '../providers/weather_provider.dart';
import '../services/get_current_weather.dart';

class SearchPageFuncs {
  ConnectivityResult? _connectivityResult;
  Future<void> onSearchPressed(context,
      {required String cityName, required FocusNode focusNode}) async {
    _connectivityResult = await Connectivity().checkConnectivity();
    if (_connectivityResult == ConnectivityResult.wifi ||
        _connectivityResult == ConnectivityResult.mobile) {
      if (cityName.isNotEmpty) {
        try {
          Provider.of<WeatherProvider>(context, listen: false).weatherModel =
              await GetCurrentWeather().getCurrentWeather(cityName: cityName);
          Provider.of<WeatherProvider>(context, listen: false)
                  .listOfWeatherModels =
              await GetHourlyForecast().getHourlyForecast(cityName: cityName);
          //if statement used to prevent renderflex error caused
          //because of the keyboard
          if (focusNode.hasFocus) {
            FocusManager.instance.primaryFocus!.unfocus();
            await Future.delayed(const Duration(milliseconds: 500));
          }
          Navigator.pop(context);
        } catch (e) {
          ScaffoldMessenger.of(context)
              .showSnackBar(customSnackBar(title: 'City isn\'t founded'));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(customSnackBar(title: 'City name is required'));
      }
    } else {
      Navigator.pop(context);
    }
  }

  onWeatherContainerPressed(
    context, {
    required AsyncSnapshot<WeatherModel> snapshot,
    required String cityName,
    required FocusNode focusNode,
  }) async {
    _connectivityResult = await Connectivity().checkConnectivity();
    if (_connectivityResult == ConnectivityResult.wifi ||
        _connectivityResult == ConnectivityResult.mobile) {
      Provider.of<WeatherProvider>(context, listen: false).weatherModel =
          snapshot.data!;
      Provider.of<WeatherProvider>(context, listen: false).listOfWeatherModels =
          await GetHourlyForecast().getHourlyForecast(cityName: cityName);
      if (focusNode.hasFocus) {
        FocusManager.instance.primaryFocus!.unfocus();
        await Future.delayed(const Duration(milliseconds: 500));
      }
    }
    Navigator.pop(context);
  }
}
