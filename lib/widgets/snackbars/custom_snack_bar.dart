import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

SnackBar customSnackBar({required String title}){
  return SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 2.h,
      ),
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: const Color(0xFF322F60), fontSize: 12.sp),
      ),
    );
}