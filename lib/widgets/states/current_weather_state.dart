import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../model/weather_model.dart';
import '../../providers/weather_provider.dart';
import '../column/current_weather_column.dart';

Widget currentWeatherState(context, AsyncSnapshot<WeatherModel> snapshot) {
  if (snapshot.hasError) {
    return const CurrentWeatherColumn(
      errorMessage: true,
    );
  } else {
    if (snapshot.connectionState == ConnectionState.done) {
      Provider.of<WeatherProvider>(context, listen: false).weatherModel =
          snapshot.data!;
      return const CurrentWeatherColumn(
        errorMessage: false,
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: const Align(
          alignment: Alignment.topCenter,
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
