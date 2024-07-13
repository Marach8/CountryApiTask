import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:country_api_task/src/utils/constants/font_sizes.dart';
import 'package:country_api_task/src/utils/constants/font_weights.dart';
import 'package:flutter/material.dart';

class AgroMallTaskPopupMenuTheme{
  const AgroMallTaskPopupMenuTheme._();

  static PopupMenuThemeData lightPopupMenuTheme = PopupMenuThemeData(
    elevation: 0,
    color: AgroMallTaskColors.lightThemeBgColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
      side: BorderSide(width: 0.2, color: AgroMallTaskColors.filterButtonBorderColor,)
    ),
    textStyle: TextStyle(
      color: AgroMallTaskColors.darkThemeBgColor,
      fontSize: AgroMallTaskFontSizes.size16,
      fontWeight: AgroMallTaskFontWeights.medium,
    ),
  );


  static PopupMenuThemeData darkPopupMenuTheme = PopupMenuThemeData(
    color: AgroMallTaskColors.lightThemeBlackColor,
    surfaceTintColor: AgroMallTaskColors.lightThemeBlackColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
      side: BorderSide(width: 0.2, color: AgroMallTaskColors.grey100Color,)
    ),
    labelTextStyle: WidgetStatePropertyAll(
      TextStyle(
        fontSize: AgroMallTaskFontSizes.size16,
        fontWeight: AgroMallTaskFontWeights.medium,
        color: AgroMallTaskColors.grey100Color
      )
    )
  );
}
