import 'dart:ui';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/services/get_current_weather.dart';
import 'package:weather_app/widgets/background design/background_house.dart';
import 'package:weather_app/widgets/background design/background_shadow.dart';
import 'package:weather_app/widgets/containers/bottom_sheet_container.dart';
import 'package:weather_app/widgets/states/current_weather_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/Starry Mountain.png'),
          ),
        ),
        child: SafeArea(
          child: StreamBuilder(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, connictivitySnapshot) {
              if (connictivitySnapshot.data == ConnectivityResult.wifi ||
                  connictivitySnapshot.data == ConnectivityResult.mobile) {
                return FutureBuilder(
                  future: GetCurrentWeather().getCurrentWeather(),
                  builder: (context, weatherModelSnapshot) => Stack(
                    children: [
                      const BackgroundShadow(),
                      const BackgroundHouse(),
                      currentWeatherState(context, weatherModelSnapshot),
                      Container(
                        margin: EdgeInsets.only(top: 55.h),
                        decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(0.5),
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(25)),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                                child: Container(),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.3)),
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(25)),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFF482D80).withOpacity(0.5),
                                    const Color(0xFF482D80).withOpacity(0.5),
                                  ],
                                ),
                              ),
                            ),
                            const BottomSheetContainer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  backgroundColor: Colors.transparent.withOpacity(0.2),
                  title: const Text('Warning', textAlign: TextAlign.center),
                  content: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                    child: const Text(
                      'Make sure you are connecting to the internet !',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
