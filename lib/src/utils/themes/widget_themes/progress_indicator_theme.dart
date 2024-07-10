import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AgroMallTaskProgressIndicatorTheme{
  const AgroMallTaskProgressIndicatorTheme._();

  static ProgressIndicatorThemeData lightProgressIndicatorTheme = ProgressIndicatorThemeData(
    color: AgroMallTaskColors.lightThemeBlackColor,
    circularTrackColor: AgroMallTaskColors.grey100Color,
  );


  static ProgressIndicatorThemeData darkProgressIndicatorTheme = ProgressIndicatorThemeData(
    color: AgroMallTaskColors.darkThemeGray200Color,
    circularTrackColor: AgroMallTaskColors.darkThemeTexfFieldFillColor,
  );
}
