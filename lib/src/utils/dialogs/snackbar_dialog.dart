import 'package:country_api_task/src/riverpod_state_management/providers/countries_data_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/expansion_tile_state_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/snack_bar_is_mounted_provider.dart';
import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:country_api_task/src/utils/helpers/helper_functions.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/expansion_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class AgroMallTaskDialog{
  const AgroMallTaskDialog._();

  static void showSnackBarDialog({
    required BuildContext context
  }) => ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(days: 1),
      padding: const EdgeInsets.all(20), 
      onVisible: () {
        final ref = ProviderScope.containerOf(context, listen: false);
        ref.read(snackBarIsMountedProvider.notifier).state = true;
      },
      
      content: Container(
        constraints: BoxConstraints(
          maxHeight: AgroMallTaskHelperFunctions.getScreenHeight(context) * 0.8
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AgroMallTaskStrings.filter,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  GestureDetector(
                    onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: AgroMallTaskColors.darkThemeTexfFieldFillColor,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: const Icon(Icons.close, size: 15),
                    ),
                  )
                ],
              ),
        
              const Gap(20),
              Consumer(
                builder: (_, ref, __) {
                  final countryDataModels = ref.read(countriesDataStateProvider.notifier);
                  final listOfContinents = countryDataModels.getContinents();
      
                  return AgroMallTaskExpansionTileWidget(
                    listOfIndividualTileItemsToDisplay: listOfContinents,
                    titleOfExpansionTile: AgroMallTaskStrings.continent,
                  );
                }
              ),
          
              Consumer(
                builder: (_, ref, __) {
                  final countryDataModels = ref.watch(countriesDataStateProvider.notifier);
                  final listOfTimezones = countryDataModels.getTimezones();
      
                  return AgroMallTaskExpansionTileWidget(
                    listOfIndividualTileItemsToDisplay: listOfTimezones,
                    titleOfExpansionTile: AgroMallTaskStrings.timezone,
                  );
                }
              ),
            ],
          ),
        ),
      ),
    )
  ).closed.then(
    (_){
      final ref = ProviderScope.containerOf(context, listen: false);
      ref.read(expansionTileIsExpandedProvider(AgroMallTaskStrings.continent).notifier).state = false;
      ref.read(expansionTileIsExpandedProvider(AgroMallTaskStrings.timezone).notifier).state = false;
      ref.read(snackBarIsMountedProvider.notifier).state = false;
    }
  );
}