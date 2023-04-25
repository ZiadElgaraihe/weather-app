import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/services/get_hourly_forecast.dart';
import 'package:weather_app/widgets/nav%20bar/bottom_nav_bar.dart';
import 'package:weather_app/widgets/states/hourly_weather_state.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextButton(
          onPressed: null,
          child: Text(
            'Hourly Forecast',
            style: TextStyle(
              color: Color(0xFF66F2D2),
            ),
          ),
        ),
        Divider(height: 0.5, color: Colors.white.withOpacity(0.3)),
        const Spacer(),
        SizedBox(
          height: 20.h,
          child: FutureBuilder(
            future: GetHourlyForecast().getHourlyForecast(),
            builder: (context, snapshot) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                      color: snapshot.hasData &&
                              snapshot.data![index].dateTime! ==
                                  DateTime.now().hour
                          ? const Color(0xFF48319D)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50)),
                  margin: const EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(1.w),
                  width: 15.w,
                  child: hourlyWeatherState(
                    context,
                    snapshot: snapshot,
                    index: index,
                  ),
                );
              },
            ),
          ),
        ),
        const Spacer(),
        const BottomNavBar(),
      ],
    );
  }
}
