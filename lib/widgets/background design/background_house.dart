import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BackgroundHouse extends StatelessWidget {
  const BackgroundHouse({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 17.h,
      child: Image.asset('assets/images/House.png'),
    );
  }
}
