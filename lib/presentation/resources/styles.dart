import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/color_manger.dart';

abstract class Styles {
  static TextStyle textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ColorManger.primaryColor,
  );

  static TextStyle textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorManger.primaryColor,

    // there are another wight its regular
  );
  static TextStyle textStyle12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: ColorManger.primaryColor,
    // there are another wight its bold
  );
  static TextStyle textStyle11 = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: ColorManger.primaryColor,
  );
  static TextStyle textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: ColorManger.primaryColor,
  );
  static const textStyle22 = TextStyle(
    fontSize: 22,
    color: Colors.white,
  );
}
