import 'package:country_api_task/src/riverpod_state_management/providers/theme_mode_provider.dart';
import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgroMallTaskAnnotatedRegionWidget extends ConsumerWidget {
  final Widget child;

  const AgroMallTaskAnnotatedRegionWidget({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeModeProvider);
    final inDarkMode = currentTheme == ThemeMode.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: inDarkMode ? AgroMallTaskColors.darkThemeBgColor : AgroMallTaskColors.lightThemeBgColor,
        systemNavigationBarIconBrightness: inDarkMode ? Brightness.light : Brightness.dark
      ),
      child: child
    );
  }
}