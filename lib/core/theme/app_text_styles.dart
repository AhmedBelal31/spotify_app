import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class TextStyles {
  static const TextStyle font26Bold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 26,
  );

  static const TextStyle font22Bold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: Colors.white,
  );

  static const TextStyle font20Bold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Colors.black,
  );

  static const TextStyle font20Medium = TextStyle(
    fontWeight: FontWeight.w500, // Medium weight
    fontSize: 20,
  );

  static const TextStyle font19Medium = TextStyle(
    fontWeight: FontWeight.w500, // Medium weight
    fontSize: 19,
    // color: AppColors.darkGreyColor
  );

  static const TextStyle font17Regular = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 17,
  );

  static const TextStyle font17Medium = TextStyle(
    fontWeight: FontWeight.w500, // Medium weight
    fontSize: 17,
    color: Colors.white
  );

  static const TextStyle font16Bold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Colors.black,
  );

  static const TextStyle font16Medium = TextStyle(
    fontWeight: FontWeight.w500, // Medium weight
    fontSize: 16,
    color: Colors.black,
  );

  static const TextStyle font15Bold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  static const TextStyle font15Regular = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 15,
    color: Colors.black,
  );

  static const TextStyle font14Regular = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );

  static const TextStyle font13Bold = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 13,
  );

  static const TextStyle font12Regular = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12,
    color: Colors.black,
  );

  static const TextStyle font12Medium = TextStyle(
    fontWeight: FontWeight.w500, // Medium weight
    fontSize: 12,
  );
}
