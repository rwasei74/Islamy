import 'package:flutter/material.dart';
import 'package:islamy_app/utils/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transsparentColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
     // backgroundColor: AppColors.primaryColor,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
    )

  );

}