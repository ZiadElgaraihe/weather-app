import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/services/get_current_weather.dart';
import 'package:weather_app/widgets/containers/weather_container.dart';

class CustomListView extends StatelessWidget {
  final FocusNode focusNode;
  const CustomListView({super.key, required this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: mainCities.length,
        itemBuilder: (context, index) => FutureBuilder(
          future:
              GetCurrentWeather().getCurrentWeather(cityName: mainCities[index]),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.done
                ? WeatherContainer(
                    snapshot: snapshot,
                    cityName: mainCities[index],
                    focusNode: focusNode,
                  )
                : Container(
                    margin: EdgeInsets.symmetric(vertical: 2.h),
                    height: 20.h,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
