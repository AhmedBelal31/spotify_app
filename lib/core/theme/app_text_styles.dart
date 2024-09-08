import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class TextStyles {
  static TextStyle font30Bold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30.sp,
  );

  static TextStyle font26Bold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 26.sp,
  );

  static TextStyle font22Bold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22.sp,
    color: Colors.white,
  );

  static TextStyle font20Bold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20.sp,
    color: Colors.black,
  );

  static TextStyle font20Medium = TextStyle(
    fontWeight: FontWeight.w500, // Medium weight
    fontSize: 20.sp,
  );

  static TextStyle font19Medium = TextStyle(
    fontWeight: FontWeight.w500, // Medium weight
    fontSize: 19.sp,
    // color: AppColors.darkGreyColor
  );

  static TextStyle font17Regular = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 17.sp,
  );

  static TextStyle font17Medium = TextStyle(
      fontWeight: FontWeight.w500, // Medium weight
      fontSize: 17.sp,
      color: Colors.white);

  static TextStyle font16Bold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16.sp,
    color: Colors.black,
  );

  static TextStyle font16Medium = TextStyle(
    fontWeight: FontWeight.w500, // Medium weight
    fontSize: 16.sp,
    color: Colors.black,
  );

  static TextStyle font15Bold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15.sp,
  );

  static TextStyle font15Regular = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 15.sp,
    color: Colors.black,
  );

  static TextStyle font14Regular = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14.sp,
  );

  static TextStyle font13Bold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 13.sp,
  );

  static TextStyle font12Regular = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12.sp,
    color: Colors.black,
  );

  static TextStyle font12Medium = TextStyle(
    fontWeight: FontWeight.w500, // Medium weight
    fontSize: 12.sp,
  );
}
