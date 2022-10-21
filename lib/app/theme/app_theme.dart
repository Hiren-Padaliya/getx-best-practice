import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'app_colors.dart';

ThemeData _baseTheme = ThemeData.light();

final ThemeData appThemeData = ThemeData(
  primarySwatch: brand,
  primaryColor: primaryColor,
  errorColor: errorColor,
  disabledColor: Colors.grey,
  scaffoldBackgroundColor: Colors.white,
  hintColor: Colors.black54,
  appBarTheme: AppBarTheme(
      color: brand,
      elevation: 1
  ),
  fontFamily: 'Cairo',
  typography: _baseTheme.typography.copyWith(
    black: _baseTheme.typography.black.copyWith(
      caption: const TextStyle(color: neutral,),
      bodyText1: const TextStyle(color: neutral,),
      bodyText2: const TextStyle(color: neutral),
      subtitle1: const TextStyle(color: neutral),
      subtitle2: const TextStyle(color: neutral),
      button: const TextStyle(color: primaryColor),
    ),
  ),
  buttonTheme: _baseTheme.buttonTheme.copyWith(
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0.sp)),
    ),
  ),
  buttonColor: primaryColor,
  textTheme: _baseTheme.textTheme.copyWith(
    caption:  const TextStyle(color: neutral),
    bodyText1: const TextStyle(color: neutral,),
    bodyText2: const TextStyle(color: neutral),
    subtitle1: const TextStyle(color: Colors.grey),
    subtitle2: const TextStyle(color: Colors.grey),
    button: TextStyle(fontSize: 12.0.sp,color: primaryColor),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);