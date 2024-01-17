import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/styles.dart';

import 'color_manger.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //Main Colors
    primaryColor: ColorManger.primaryColor,
    primaryColorLight: ColorManger.lightPrimary,
    primaryColorDark: ColorManger.darkPrimary,
    disabledColor: ColorManger.grey1,
    splashColor: ColorManger.lightPrimary,

    // CardView Theme
    cardTheme: CardTheme(
      color: ColorManger.white,
      shadowColor: ColorManger.grey,
      elevation: 4,
    ),
    //App Bar Theme
    appBarTheme: AppBarTheme(
      color: ColorManger.primaryColor,
      titleTextStyle: Styles.textStyle16,
      centerTitle: true,
      elevation: 3,
      shadowColor: ColorManger.lightPrimary,
    ),

    //Button Theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManger.grey,
      buttonColor: ColorManger.primaryColor,
      splashColor: ColorManger.lightPrimary,
    ),

    // elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: Styles.textStyle16.copyWith(
          fontWeight: FontWeight.w400,
        ),
        backgroundColor: ColorManger.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),

    // text theme
    textTheme: TextTheme(
      displayLarge: Styles.textStyle22.copyWith(),
      headlineLarge: Styles.textStyle16.copyWith(
        color: ColorManger.darkGrey,
      ),
      titleMedium: Styles.textStyle14,
      bodyLarge: Styles.textStyle12.copyWith(
        color: ColorManger.grey,
      ),
      bodySmall: Styles.textStyle12.copyWith(
        color: ColorManger.grey1,
      ),
    ),
    // input decoration theme (Text Form Field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(8),
      hintStyle: Styles.textStyle14.copyWith(
        fontWeight: FontWeight.w400,
        color: ColorManger.grey,
      ),
      labelStyle: Styles.textStyle14.copyWith(
        color: ColorManger.grey,
      ),
      errorStyle: TextStyle(color: ColorManger.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManger.primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManger.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManger.error,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManger.primaryColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}
