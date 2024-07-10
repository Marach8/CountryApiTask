import 'package:country_api_task/src/providers/countries_data_provider.dart';
import 'package:country_api_task/src/providers/expansion_tile_state_provider.dart';
import 'package:country_api_task/src/providers/selected_check_box_provider.dart';
import 'package:country_api_task/src/utils/constants/font_weights.dart';
import 'package:country_api_task/src/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgroMallTaskExpansionTileWidget extends StatelessWidget {
  final List<String> listOfIndividualTileItemsToDisplay;
  final String titleOfExpansionTile;

  const AgroMallTaskExpansionTileWidget({
    super.key,
    required this.listOfIndividualTileItemsToDisplay,
    required this.titleOfExpansionTile,f
  });


  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: EdgeInsets.zero,
      tilePadding: EdgeInsets.zero,
      dense: true,
      title: Consumer(
        builder: (_, titleRef, __) {
          final tileIsExpanded = titleRef.watch(expansionTileIsExpandedProvider(titleOfExpansionTile));
          return Text(
            titleOfExpansionTile,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: tileIsExpanded ? AgroMallTaskFontWeights.extraBold : AgroMallTaskFontWeights.medium
            )
          );
        }
      ),
      trailing: Consumer(
        builder: (_, trailingRef, __) {
          final tileIsExpanded = trailingRef.watch(expansionTileIsExpandedProvider(titleOfExpansionTile));
          return Icon(
            tileIsExpanded ? Icons.keyboard_arrow_up_sharp : Icons.keyboard_arrow_down_sharp
          );
        }
      ),
      
      onExpansionChanged: (value){
        final ref = ProviderScope.containerOf(context, listen: false);
        ref.read(expansionTileIsExpandedProvider(titleOfExpansionTile).notifier).state = value;
      },
      
      children: listOfIndividualTileItemsToDisplay.map(
        (childTileTitle) => Consumer(
          builder: (_, checkBoxRef, __) {
            final isSelected = checkBoxRef.watch(checkBoxIsSelectedProvider(childTileTitle));
            return CheckboxListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              title: Text(
                childTileTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              value: isSelected,
              onChanged: (value) {
                AgroMallTaskHelperFunctions.increaseOrDecreaseNumberOfCheckBoxTicks(
                  valueToCheck: value ?? false, 
                  context: context
                );
                checkBoxRef.read(checkBoxIsSelectedProvider(childTileTitle).notifier).state = value ?? false;
                checkBoxRef.read(countriesDataStateProvider.notifier).setCheckboxTileValue(
                  titleOfExpansionTile: titleOfExpansionTile,
                  titleOfCheckBoxTile: childTileTitle,
                  valueToBeSet: value ?? false
                );
              }
            );
          }
        )
      ).toList()
    );
  }
}