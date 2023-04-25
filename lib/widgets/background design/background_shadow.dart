import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BackgroundShadow extends StatelessWidget {
  const BackgroundShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 78.h),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF3A3F54).withOpacity(0.8),
              offset: Offset(0, -17.5.h),
              spreadRadius: 10.h,
              blurRadius: 100,
            )
          ],
          color: const Color(0xFF3A3F54),
        ),
      ),
    );
  }
}
