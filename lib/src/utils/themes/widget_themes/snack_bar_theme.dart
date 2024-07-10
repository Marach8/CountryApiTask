import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AgroMallTaskSnackBarTheme{
  const AgroMallTaskSnackBarTheme._();

  static SnackBarThemeData lightSnackBarTheme = SnackBarThemeData(
    elevation: 0,
    backgroundColor: AgroMallTaskColors.lightThemeBgColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32)
      ),
    ),
  );


  static SnackBarThemeData darkSnackBarTheme = SnackBarThemeData(
    elevation: 0,
    backgroundColor: AgroMallTaskColors.lightThemeBlackColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32)
      ),
    ),
  );
}
