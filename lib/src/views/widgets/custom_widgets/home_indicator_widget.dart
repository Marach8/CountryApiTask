import 'package:country_api_task/src/riverpod_state_management/providers/theme_mode_provider.dart';
import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:country_api_task/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgroMallTaskHomeIndicatorWidget extends ConsumerWidget {
  const AgroMallTaskHomeIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeModeProvider);
    final inDarkMode = currentTheme == ThemeMode.dark;
    final screenWidth = AgroMallTaskHelperFunctions.getScreenWidth(context);
    final marginDistance = (screenWidth - 134)/2;
    
    return Container(
      margin: EdgeInsets.fromLTRB(marginDistance, 0, marginDistance, 10),
      padding: EdgeInsets.zero,
      height: 5,
      width: 134,
      decoration: BoxDecoration(
        color: inDarkMode ? AgroMallTaskColors.darkThemeGray200Color : AgroMallTaskColors.lightThemeBlackColor,
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }
}