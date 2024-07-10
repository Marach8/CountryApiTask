import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:country_api_task/src/utils/constants/font_sizes.dart';
import 'package:country_api_task/src/utils/constants/font_weights.dart';
import 'package:flutter/material.dart';

class AgroMallTaskTextTheme{
  const AgroMallTaskTextTheme._();

  static TextTheme lightTextTheme = TextTheme( 

    displayMedium: TextStyle(
      color: AgroMallTaskColors.lightThemeGrey900Color,
      fontSize: AgroMallTaskFontSizes.size20,
      fontWeight: AgroMallTaskFontWeights.extraBold,
    ),

    headlineMedium: TextStyle(
      color: AgroMallTaskColors.lightThemeGrey900Color,
      fontSize: AgroMallTaskFontSizes.size14,
      fontWeight: AgroMallTaskFontWeights.medium,
    ),

    bodyMedium : TextStyle(
      color: AgroMallTaskColors.lightThemeGrey500Color,
      fontSize: AgroMallTaskFontSizes.size14,
      fontWeight: AgroMallTaskFontWeights.medium,
    ), 
    
    labelMedium: TextStyle(
      color: AgroMallTaskColors.lightThemeGrey500Color,
      fontSize: AgroMallTaskFontSizes.size16,
      fontWeight: AgroMallTaskFontWeights.medium,
    ),

    titleMedium: TextStyle(
      color: AgroMallTaskColors.lightThemeGrey900Color,
      fontSize: AgroMallTaskFontSizes.size16,
      fontWeight: AgroMallTaskFontWeights.semiBold,
    ),
  );


  static TextTheme darkTextTheme = TextTheme( 
 
    displayMedium: TextStyle(
      color: AgroMallTaskColors.darkThemeGray200Color,
      fontSize: AgroMallTaskFontSizes.size20,
      fontWeight: AgroMallTaskFontWeights.extraBold,
    ),

    headlineMedium: TextStyle(
      color: AgroMallTaskColors.grey100Color,
      fontSize: AgroMallTaskFontSizes.size14,
      fontWeight: AgroMallTaskFontWeights.medium,
    ),

    bodyMedium : TextStyle(
      color: AgroMallTaskColors.gray400Color,
      fontSize: AgroMallTaskFontSizes.size14,
      fontWeight: AgroMallTaskFontWeights.medium,
    ), 
    
    labelMedium: TextStyle(
      color: AgroMallTaskColors.darkThemeGray300Color,
      fontSize: AgroMallTaskFontSizes.size16,
      fontWeight: AgroMallTaskFontWeights.medium,
    ),

    titleMedium: TextStyle(
      color: AgroMallTaskColors.grey100Color,
      fontSize: AgroMallTaskFontSizes.size16,
      fontWeight: AgroMallTaskFontWeights.semiBold,
    ),
  );

}