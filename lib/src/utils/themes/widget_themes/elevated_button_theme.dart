import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:country_api_task/src/utils/constants/font_sizes.dart';
import 'package:country_api_task/src/utils/constants/font_weights.dart';
import 'package:flutter/material.dart';

class AgroMallTaskElevatedButtonTheme{
  const AgroMallTaskElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AgroMallTaskColors.lightThemeGrey900Color,
      backgroundColor: AgroMallTaskColors.lightThemeBgColor,
      disabledForegroundColor: AgroMallTaskColors.darkThemeTexfFieldFillColor,
      iconColor: AgroMallTaskColors.lightThemeGrey900Color,
      textStyle: TextStyle(
        color: AgroMallTaskColors.lightThemeBlackColor,
        fontSize: AgroMallTaskFontSizes.size12,
        fontWeight: AgroMallTaskFontWeights.semiBold
      ),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(
          color: AgroMallTaskColors.filterButtonBorderColor,
          width: 0.2
        )
      )
    )
  );


  static ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      iconColor: AgroMallTaskColors.darkThemeGray300Color,
      foregroundColor: AgroMallTaskColors.grey100Color,
      disabledForegroundColor: AgroMallTaskColors.darkThemeTexfFieldFillColor,
      backgroundColor: AgroMallTaskColors.darkThemeBgColor,
      textStyle: TextStyle(
        color: AgroMallTaskColors.darkThemeGray300Color,
        fontSize: AgroMallTaskFontSizes.size12,
        fontWeight: AgroMallTaskFontWeights.semiBold
      ),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(
          color: AgroMallTaskColors.grey100Color,
          width: 0.2
        )
      )
    )
  );
}