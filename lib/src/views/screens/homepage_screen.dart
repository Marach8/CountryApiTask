import 'package:country_api_task/src/riverpod_state_management/providers/countries_data_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/expansion_tile_state_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/theme_mode_provider.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:country_api_task/src/utils/dialogs/snackbar_dialog.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/annotated_region.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/asset_svg_display_widget.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/elevated_button_with_icon_widget.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/home_indicator_widget.dart';
import 'package:country_api_task/src/views/widgets/other_widgets/row_with_two_buttons_widget.dart';
import 'package:country_api_task/src/views/widgets/other_widgets/sorted_list_of_countries_widget.dart';
import 'package:country_api_task/src/views/widgets/other_widgets/textform_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class AgroMallTaskHomepageScreen extends StatelessWidget {
  const AgroMallTaskHomepageScreen({super.key});

  @override
  Widget build(BuildContext context,) {
    

    return AgroMallTaskAnnotatedRegionWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Consumer(
            builder: (_, exploreRef, __) {
              final currentTheme = exploreRef.watch(themeModeProvider);
              final inDarkMode = currentTheme == ThemeMode.dark;

              return AgroMallTaskAssetSvgDisplayWidget(
                svgPath: inDarkMode ? AgroMallTaskStrings.lightExploreText : AgroMallTaskStrings.darkExploreText
              );
            }
          ),
          actions: [
            Consumer(
              builder: (_, themeSelectorRef, __) {
                final currentTheme = themeSelectorRef.watch(themeModeProvider);
                final inDarkMode = currentTheme == ThemeMode.dark;

                return Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: inDarkMode ? GestureDetector(
                    onTap: () => themeSelectorRef.read(countriesDataStateProvider.notifier).changeToLightMode(),
                    child: const AgroMallTaskAssetSvgDisplayWidget(svgPath: AgroMallTaskStrings.svgHalfMoon),
                  ) :
                  IconButton(
                    onPressed: () => themeSelectorRef.read(countriesDataStateProvider.notifier).changeToDarkMode(),
                    icon: const Icon(Icons.wb_sunny_outlined)
                  )
                );
              }
            ),
            
          ],
        ),
      
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: Column(
            children: [
              const AgroMallTaskTextFormField(),
              const Gap(10),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AgroMallTaskElevatedButtonWithIconWidget(
                    onPressed: () {},
                    icon: Iconsax.global,
                    label: AgroMallTaskStrings.en,
                  ),
                  AgroMallTaskElevatedButtonWithIconWidget(
                    onPressed: () => AgroMallTaskDialog.showSnackBarDialog(context: context),
                    icon: Icons.filter_alt_outlined,
                    buttonWidth: 86,
                    label: AgroMallTaskStrings.filter,
                  ),
                ],
              ),
          
              const Gap(20),
              const Expanded(
                child: AgroMallTaskHomeWidget()
              )
            ],
          ),
        ),
      
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [            
            Consumer(
              builder: (_, buttonRef, __) {
                final continentTileIsExpanded = buttonRef.watch(expansionTileIsExpandedProvider(AgroMallTaskStrings.continent));
                final timezoneTileIsExpanded = buttonRef.watch(expansionTileIsExpandedProvider(AgroMallTaskStrings.timezone));
                final anyOfTheTilesIsExpanded = continentTileIsExpanded || timezoneTileIsExpanded;

                return Visibility(
                  visible: anyOfTheTilesIsExpanded,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
                    child: AgroMallTaskRowWithTwoButtonsWidget(),
                  )
                );
              }
            ),
            const AgroMallTaskHomeIndicatorWidget(),
          ],
        ),
      ),
    );
  }
}
