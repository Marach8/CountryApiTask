import 'package:country_api_task/src/riverpod_state_management/providers/countries_data_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/snack_bar_is_mounted_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/text_field_controller_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/theme_mode_provider.dart';
import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgroMallTaskTextFormField extends ConsumerWidget {
  const AgroMallTaskTextFormField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeModeProvider);
    final controller = ref.watch(textfieldControllerProvider);
    final inDarkMode = currentTheme == ThemeMode.dark;
    final snackBarIsMounted = ref.watch(snackBarIsMountedProvider);

    return TextFormField(
      controller : controller,
      enabled: !snackBarIsMounted, 
      cursorColor: inDarkMode ? AgroMallTaskColors.lightThemeBgColor : AgroMallTaskColors.lightThemeBlackColor,
      onChanged: (value) => ref.read(countriesDataStateProvider.notifier).filterCountriesBySearchKey(value),
      textAlign: TextAlign.center,
      decoration: const InputDecoration(
        hintText: AgroMallTaskStrings.searchCountry, 
        prefixIcon: Icon(Icons.search, size: 25,),
      ),
    );
  }
}