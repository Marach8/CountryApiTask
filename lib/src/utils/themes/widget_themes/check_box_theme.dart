import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AgroMallTaskCheckBoxTheme{
  const AgroMallTaskCheckBoxTheme._();

  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
      side: BorderSide(color: AgroMallTaskColors.darkThemeGray300Color),
    ),
    checkColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return AgroMallTaskColors.lightThemeBgColor;
      }
      else{
        return AgroMallTaskColors.lightThemeGrey900Color;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return AgroMallTaskColors.lightThemeGrey900Color;
      }
      else{
        return AgroMallTaskColors.transparentColor;
      }
    }),
  );


  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
      side: BorderSide(color: AgroMallTaskColors.darkThemeGray300Color),
    ),
    checkColor: WidgetStateProperty.resolveWith((state){
      if(state.contains(WidgetState.selected)){
        return AgroMallTaskColors.lightThemeBlackColor;
      }
      else{
        return AgroMallTaskColors.transparentColor;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((state){
      if(state.contains(WidgetState.selected)){
        return AgroMallTaskColors.grey100Color;
      }
      else{
        return AgroMallTaskColors.transparentColor;
      }
    }),
  );
}