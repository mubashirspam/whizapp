import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whizapp/core/theme/color.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    // backgroundColor: AppColor.backgroundLight,
    colorScheme: const ColorScheme.light(
      background: AppColor.backgroundLight,
    ),
    scaffoldBackgroundColor: AppColor.backgroundLight,
    // extensions: [CustomThemeExtension.lightMode],
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.backgroundLight,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primeryLight,
        foregroundColor: AppColor.textwhiteLight,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColor.backgroundLight,
      modalBackgroundColor: AppColor.backgroundLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    ),
    dialogBackgroundColor: AppColor.backgroundLight,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    switchTheme: const SwitchThemeData(
      thumbColor: MaterialStatePropertyAll(
        Color(0xFF83939C),
      ),
      trackColor: MaterialStatePropertyAll(
        Color(0xFFDADFE2),
      ),
    ),

    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: AppColor.textPrimeryLight,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: AppColor.textPrimeryLight,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        color: AppColor.textSecondaryLight,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: TextStyle(
        color: AppColor.textPrimeryLight,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: AppColor.textPrimeryLight,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: AppColor.textSecondaryLight,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: TextStyle(
        color: AppColor.textPrimeryLight,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: AppColor.textVilotLight,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
