import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';

class CurrentWeatherColumn extends StatelessWidget {
  final bool errorMessage;
  const CurrentWeatherColumn({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Selector<WeatherProvider, WeatherModel>(
      selector: (context, provider) => provider.weatherModel,
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.only(top: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text((errorMessage) ? 'N/A' : value.city,
                style: TextStyle(fontSize: 22.sp)),
            Text(
              (errorMessage) ? 'N/A' : '${value.temp}°',
              style: TextStyle(fontSize: 50.sp),
            ),
            Text(
              (errorMessage) ? 'N/A' : value.weatherState,
              style: TextStyle(fontSize: 16.sp, color: Colors.white60),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (errorMessage) ? 'N/A' : 'H:${value.maxTemp}°',
                  style: TextStyle(fontSize: 14.sp),
                ),
                Text(
                  (errorMessage) ? 'N/A' : '   L:${value.minTemp}°',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
