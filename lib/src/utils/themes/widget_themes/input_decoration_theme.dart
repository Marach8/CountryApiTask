import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:country_api_task/src/utils/constants/font_sizes.dart';
import 'package:country_api_task/src/utils/constants/font_weights.dart';
import 'package:flutter/material.dart';

class AgroMallTaskInputDecorationTheme{
  const AgroMallTaskInputDecorationTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    isDense: true,
    fillColor: AgroMallTaskColors.grey100Color,
    filled: true,
    prefixIconColor: AgroMallTaskColors.lightThemeGrey500Color,
    hintStyle: TextStyle(
      color: AgroMallTaskColors.lightThemeGrey500Color,
      fontSize: AgroMallTaskFontSizes.size16,
      fontWeight: AgroMallTaskFontWeights.regular
    ),
    contentPadding: const EdgeInsets.only(top: 13),
    focusedBorder: InputBorder.none,
    border: InputBorder.none,
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: AgroMallTaskColors.transparentColor,),
    ),
  );


  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    isDense: true,
    fillColor: AgroMallTaskColors.darkThemeTexfFieldFillColor,
    filled: true,
    prefixIconColor: AgroMallTaskColors.darkThemeGray200Color,
    activeIndicatorBorder: BorderSide.none,
    hintStyle: TextStyle(
      color: AgroMallTaskColors.grey400Color,
      fontSize: AgroMallTaskFontSizes.size16,
      fontWeight: AgroMallTaskFontWeights.regular,
      
    ),
    contentPadding: const EdgeInsets.only(top: 13),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: AgroMallTaskColors.transparentColor,),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: AgroMallTaskColors.transparentColor,),
    ),
    disabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: AgroMallTaskColors.transparentColor,),
    ),
  );
}