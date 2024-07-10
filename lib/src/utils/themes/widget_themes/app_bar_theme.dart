import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:country_api_task/src/utils/constants/font_sizes.dart';
import 'package:country_api_task/src/utils/constants/font_weights.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class AgroMallTaskAppBarTheme{
  const AgroMallTaskAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: AgroMallTaskColors.lightThemeBgColor,
    titleTextStyle: TextStyle(
      fontFamily: AgroMallTaskStrings.axiforma,
      fontSize: AgroMallTaskFontSizes.size20,
      fontWeight: AgroMallTaskFontWeights.extraBold,
      color: AgroMallTaskColors.lightThemeGrey900Color
    )
  );


  static AppBarTheme darkAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: AgroMallTaskColors.darkThemeBgColor,
    titleTextStyle: TextStyle(
      fontFamily: AgroMallTaskStrings.axiforma,
      fontSize: AgroMallTaskFontSizes.size20,
      fontWeight: AgroMallTaskFontWeights.extraBold,
      color: AgroMallTaskColors.darkThemeGray200Color
    )
  );
}
