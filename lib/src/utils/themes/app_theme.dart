import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:country_api_task/src/utils/themes/widget_themes/app_bar_theme.dart';
import 'package:country_api_task/src/utils/themes/widget_themes/check_box_theme.dart';
import 'package:country_api_task/src/utils/themes/widget_themes/elevated_button_theme.dart';
import 'package:country_api_task/src/utils/themes/widget_themes/expansion_tile_theme.dart';
import 'package:country_api_task/src/utils/themes/widget_themes/icon_theme.dart';
import 'package:country_api_task/src/utils/themes/widget_themes/input_decoration_theme.dart';
import 'package:country_api_task/src/utils/themes/widget_themes/popup_menu_theme.dart';
import 'package:country_api_task/src/utils/themes/widget_themes/progress_indicator_theme.dart';
import 'package:country_api_task/src/utils/themes/widget_themes/snack_bar_theme.dart';
import 'package:country_api_task/src/utils/themes/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';

class AgroMallTaskAppThemeData{
  const AgroMallTaskAppThemeData._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AgroMallTaskStrings.axiforma,
    brightness: Brightness.light,
    iconTheme: AgroMallTaskIconTheme.lightIconTheme,
    scaffoldBackgroundColor: AgroMallTaskColors.lightThemeBgColor,
    progressIndicatorTheme: AgroMallTaskProgressIndicatorTheme.lightProgressIndicatorTheme,
    expansionTileTheme: AgroMallTaskExpansionTileTheme.lightExpansionTileTheme,
    textTheme: AgroMallTaskTextTheme.lightTextTheme,
    elevatedButtonTheme: AgroMallTaskElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: AgroMallTaskAppBarTheme.lightAppBarTheme,
    checkboxTheme: AgroMallTaskCheckBoxTheme.lightCheckBoxTheme,
    snackBarTheme: AgroMallTaskSnackBarTheme.lightSnackBarTheme,
    popupMenuTheme: AgroMallTaskPopupMenuTheme.lightPopupMenuTheme,
    inputDecorationTheme: AgroMallTaskInputDecorationTheme.lightInputDecorationTheme,
  );


  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    progressIndicatorTheme: AgroMallTaskProgressIndicatorTheme.darkProgressIndicatorTheme,
    fontFamily: AgroMallTaskStrings.axiforma,
    brightness: Brightness.dark,
    iconTheme: AgroMallTaskIconTheme.darkIconTheme,
    scaffoldBackgroundColor: AgroMallTaskColors.darkThemeBgColor,
    expansionTileTheme: AgroMallTaskExpansionTileTheme.darkExpansionTileTheme,
    textTheme: AgroMallTaskTextTheme.darkTextTheme,
    popupMenuTheme: AgroMallTaskPopupMenuTheme.darkPopupMenuTheme,
    elevatedButtonTheme: AgroMallTaskElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: AgroMallTaskAppBarTheme.darkAppBarTheme,
    snackBarTheme: AgroMallTaskSnackBarTheme.darkSnackBarTheme,
    checkboxTheme: AgroMallTaskCheckBoxTheme.darkCheckBoxTheme,
    inputDecorationTheme: AgroMallTaskInputDecorationTheme.darkInputDecorationTheme,
  );
}