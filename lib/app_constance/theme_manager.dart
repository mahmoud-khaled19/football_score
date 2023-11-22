import 'package:flutter/material.dart';
import 'package:football_app/app_constance/style_manager.dart';
import 'package:football_app/app_constance/values_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_dimensions.dart';
import 'colors_manager.dart';

ThemeData getLightApplicationTheme(context) {
  return ThemeData(
      drawerTheme: DrawerThemeData(scrimColor: ColorsManager.lightSecondColor),
      cardColor: ColorsManager.lightCardColor,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: GoogleFonts.akshar(
              color: ColorsManager.lightSecondColor,
              fontSize: AppSize.s16,
              letterSpacing: 0.6,
              fontWeight: FontWeight.w500),
          backgroundColor: ColorsManager.lightPrimaryColor,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black, size: AppSize.s18)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorsManager.lightPrimaryColor,
          type: BottomNavigationBarType.shifting,
          elevation: 0,
          selectedItemColor: ColorsManager.lightSecondColor,
          unselectedIconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          showSelectedLabels: false,
          showUnselectedLabels: false),
      iconTheme: IconThemeData(
          color: ColorsManager.lightSplashColor, size: AppSize.s30),
      scaffoldBackgroundColor: ColorsManager.lightSecondColor,
      primarySwatch: Colors.grey,
      splashColor: ColorsManager.lightSplashColor,
      primaryColor: ColorsManager.lightPrimaryColor,
      disabledColor: ColorsManager.grey,
      textTheme: TextTheme(
          headlineLarge: getSemiBoldStyle(
              fontSize: AppDimensions.screenHeight(context) * 0.035,
              color: ColorsManager.lightSplashColor),
          titleLarge: getSemiBoldStyle(
              fontSize: AppDimensions.screenHeight(context) * 0.03,
              color: ColorsManager.lightSplashColor),
          titleMedium: getMediumStyle(
              fontSize: AppDimensions.screenHeight(context) * 0.02,
              color: ColorsManager.lightSplashColor),
          titleSmall: getRegularStyle(
              fontSize: AppDimensions.screenHeight(context) * 0.014,
              color: ColorsManager.grey)),
      brightness: Brightness.light);
}

ThemeData getDarkApplicationTheme(context) {
  return ThemeData(
      scaffoldBackgroundColor: ColorsManager.darkPrimaryColor,
      cardColor: ColorsManager.darkCardColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
          titleTextStyle: GoogleFonts.akshar(
              color: Colors.white,
              fontSize: AppSize.s16,
              letterSpacing: 0.6,
              fontWeight: FontWeight.w500),
          backgroundColor: ColorsManager.darkSecondColor,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white, size: AppSize.s18)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ColorsManager.darkSecondColor,
        type: BottomNavigationBarType.shifting,
        elevation: 0,
        selectedItemColor: ColorsManager.darkSecondColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
      ),
      iconTheme: IconThemeData(
          color: ColorsManager.darkSecondColor, size: AppSize.s30),
      primarySwatch: Colors.grey,
      splashColor: ColorsManager.darkSplashColor,
      primaryColor: ColorsManager.darkPrimaryColor,
      disabledColor: ColorsManager.grey,
      textTheme: TextTheme(
          headlineLarge: getSemiBoldStyle(
              fontSize: AppDimensions.screenHeight(context) * 0.035,
              color: ColorsManager.darkSecondColor),
          titleLarge: getSemiBoldStyle(
              fontSize: AppDimensions.screenHeight(context) * 0.03,
              color: ColorsManager.darkSecondColor),
          titleMedium: getMediumStyle(
              fontSize: AppDimensions.screenHeight(context) * 0.02,
              color: ColorsManager.darkSecondColor),
          titleSmall: getRegularStyle(
              fontSize: AppDimensions.screenHeight(context) * 0.014,
              color: ColorsManager.grey)),
      brightness: Brightness.dark);
}
