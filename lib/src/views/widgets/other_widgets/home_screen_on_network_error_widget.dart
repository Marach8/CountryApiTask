import 'package:country_api_task/src/riverpod_state_management/providers/countries_data_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/theme_mode_provider.dart';
import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:country_api_task/src/utils/constants/font_weights.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class AgroMallTaskHomeScreenOnNetworkErrorWidget extends StatelessWidget {
  const AgroMallTaskHomeScreenOnNetworkErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          textAlign: TextAlign.center,
          AgroMallTaskStrings.errorOccured,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: AgroMallTaskFontWeights.heavy
          ),
        ),
        const Gap(40),

        Consumer(
          builder: (_, ref, __) {
            final currentTheme = ref.watch(themeModeProvider);
            final inDarkMode = currentTheme == ThemeMode.dark;
            
            return AgroMallTaskElevatedButtonWidget(
              width: 150,
              color: inDarkMode ? AgroMallTaskColors.darkThemeYellowButtonBgColor : AgroMallTaskColors.lightThemeYellowButtonBgColor,
              childText: AgroMallTaskStrings.refresh,
              onPressed: () => ref.read(countriesDataStateProvider.notifier).fetchCountriesData(),
            );
          }
        )
      ],
    );
  }
}