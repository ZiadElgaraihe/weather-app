import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../model/weather_model.dart';
import '../../providers/weather_provider.dart';

Widget hourlyWeatherState(
  BuildContext context, {
  required AsyncSnapshot<List<WeatherModel>> snapshot,
  required int index,
}) {
  if (snapshot.hasError) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text('N/A'),
        ),
        Image.asset('N/A'),
        const Text('N/A°'),
      ],
    );
  } else {
    if (snapshot.connectionState == ConnectionState.done) {
      context.read<WeatherProvider>().listOfWeatherModels = snapshot.data!;
      return Selector<WeatherProvider, List<WeatherModel>>(
        selector: (context, provider) => provider.listOfWeatherModels,
        builder: (context, value, child) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                (value[index].dateTime! >= 12)
                    ? (value[index].dateTime! != 12)
                        ? '${value[index].dateTime! - 12} PM'
                        : '${value[index].dateTime!} PM'
                    : (value[index].dateTime! != 0)
                        ? '${value[index].dateTime!} AM'
                        : '12 AM',
              ),
            ),
            Image.asset(value[index].icon!),
            Text('${value[index].temp.round()}°'),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(
          vertical: 7.h,
          horizontal: 4.w,
        ),
        child: const CircularProgressIndicator(),
      );
    }
  }
}
