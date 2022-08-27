import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppStyle {
  static final heading_1 = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      fontFamily: "Yekan",
      color: AppColors.black);

  static final heading_2 = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontFamily: "Yekan",
      color: AppColors.black);

  static final heading_3 = TextStyle(
      fontSize: 18,
      fontFamily: "Yekan",
      fontWeight: FontWeight.w700,
      color: AppColors.black);

  static final subtitle = TextStyle(
      fontSize: 16,
      fontFamily: "Yekan",
      fontWeight: FontWeight.w400,
      color: AppColors.black);

  static final body_bold = TextStyle(
      fontSize: 14,
      fontFamily: "Yekan",
      fontWeight: FontWeight.w700,
      color: AppColors.black);

  static final body = TextStyle(
      fontSize: 14,
      fontFamily: "Yekan",
      fontWeight: FontWeight.w400,
      color: AppColors.black);

  static final caption = TextStyle(
      fontSize: 12,
      fontFamily: "Yekan",
      fontWeight: FontWeight.w400,
      color: AppColors.black);

  static final buttonText = TextStyle(
    fontSize: 16,
    fontFamily: "Yekan",
    fontWeight: FontWeight.w700,
    color: AppColors.black,
  );

  static final text = TextStyle(
    fontSize: 12,
    fontFamily: "Yekan",
    fontWeight: FontWeight.w700,
    color: Color(0xFF444444),
  );
}
