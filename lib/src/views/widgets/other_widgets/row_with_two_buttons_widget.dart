import 'package:country_api_task/src/riverpod_state_management/providers/countries_data_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/number_of_checkbox_ticks_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/theme_mode_provider.dart';
import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class AgroMallTaskRowWithTwoButtonsWidget extends ConsumerWidget {
  const AgroMallTaskRowWithTwoButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeModeProvider);
    final inDarkMode = currentTheme == ThemeMode.dark;
    final numberOfTicks = ref.watch(numberOfCheckboxTicksProvider);
    final noTicks = numberOfTicks <= 0;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AgroMallTaskElevatedButtonWidget(
          childText: AgroMallTaskStrings.reset,
          onPressed: () =>
            ref.read(countriesDataStateProvider.notifier).unselectAllCheckboxes()
        ),
        const Gap(40),

        Expanded(
          child: AgroMallTaskElevatedButtonWidget(
            childText: AgroMallTaskStrings.showResults,
            onPressed: noTicks ? null :(){
              // ScaffoldMessenger.of(context).hideCurrentSnackBar();
              // ref.read(expansionTileIsExpandedProvider(AgroMallTaskStrings.continent).notifier).state = false;
              // ref.read(expansionTileIsExpandedProvider(AgroMallTaskStrings.timezone).notifier).state = false;
              ref.read(countriesDataStateProvider.notifier).showSelectedFilterResults(context);
            },
            color: inDarkMode ? AgroMallTaskColors.darkThemeYellowButtonBgColor 
              : AgroMallTaskColors.lightThemeYellowButtonBgColor,
          ),
        )
      ],
    );
  }
}