import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AgroMallTaskExpansionTileTheme{
  const AgroMallTaskExpansionTileTheme._();

  static ExpansionTileThemeData lightExpansionTileTheme = ExpansionTileThemeData(
    shape: Border.all(color: AgroMallTaskColors.lightThemeBgColor),
    backgroundColor: AgroMallTaskColors.lightThemeBgColor,
  );


  static ExpansionTileThemeData darkExpansionTileTheme = ExpansionTileThemeData(
    shape: Border.all(color: AgroMallTaskColors.darkThemeBgColor),
    backgroundColor: AgroMallTaskColors.darkThemeBgColor,
  );
}
