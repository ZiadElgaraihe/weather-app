import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:weather_app/functions/search_page_funcs.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherContainer extends StatelessWidget {
  final AsyncSnapshot<WeatherModel> snapshot;
  final String cityName;
  final FocusNode focusNode;
  const WeatherContainer({
    super.key,
    required this.snapshot,
    required this.cityName, required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        SearchPageFuncs().onWeatherContainerPressed(
          context,
          snapshot: snapshot,
          cityName: cityName,
          focusNode: focusNode,
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2.h),
        height: 20.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipPath(
              clipper: Clipper(),
              child: Container(
                height: 20.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF5635B0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(2.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${snapshot.data!.temp.round()}°',
                        style: TextStyle(fontSize: 40.sp),
                      ),
                      const Spacer(),
                      Text(
                        'H:${snapshot.data!.maxTemp.round()}° '
                        'L:${snapshot.data!.minTemp.round()}°',
                        style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '${snapshot.data!.city}, ${snapshot.data!.country}',
                              style: TextStyle(fontSize: 12.sp)),
                          Text(snapshot.data!.weatherState,
                              style: TextStyle(fontSize: 12.sp)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: -2.5.h,
              right: 3.w,
              child: Image.asset(
                snapshot.data!.icon!,
                height: 14.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double w = size.width;
    double h = size.height;
    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, h * 0.49);
    path.quadraticBezierTo(w, h * 0.43, w - 20, h * 0.40);
    path.quadraticBezierTo(w * 0.3, h * 0.10, w * 0.05, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
