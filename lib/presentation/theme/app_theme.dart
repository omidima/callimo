import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import '../../logic/constants/colors/app_colors.dart';
import '../../logic/constants/colors/past_app_colors.dart';


class AppTheme {
  const AppTheme._();


  static final lightTheme = ThemeData(
      fontFamily: "Yekan",
      primaryColor: AppColors.primaryColor,
      splashColor: AppColors.primaryColor.withAlpha(50),
      iconTheme: IconThemeData(color: PastAppColors.black),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: PastAppColors.white),
      backgroundColor: PastAppColors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      sliderTheme: SliderThemeData(
          minThumbSeparation: 2,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
          trackHeight: 2,
          activeTrackColor: AppColors.primaryColor,
          thumbColor: AppColors.primaryColor));

  static final darkTheme = ThemeData(
      fontFamily: "Yekan",
      primaryColor: AppColors.primaryColor,
      splashColor: AppColors.primaryColor.withAlpha(50),
      iconTheme: IconThemeData(color: PastAppColors.black),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: PastAppColors.white),
      backgroundColor: PastAppColors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      sliderTheme: SliderThemeData(
          minThumbSeparation: 2,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 6),
          trackHeight: 2,
          activeTrackColor: AppColors.primaryColor,
          thumbColor: AppColors.primaryColor));

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
        systemNavigationBarColor:
            themeMode == ThemeMode.light ? AppColors.white : AppColors.black,
        systemNavigationBarDividerColor: Colors.transparent));
  }
}
