import 'package:country_api_task/src/notifiers/country_data_state.dart';
import 'package:country_api_task/src/utils/constants/font_sizes.dart';
import 'package:country_api_task/src/utils/constants/font_weights.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:country_api_task/src/utils/helpers/extensions.dart';
import 'package:country_api_task/src/utils/helpers/helper_functions.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/country_flag_display_widget.dart';
import 'package:country_api_task/src/views/widgets/other_widgets/inner_page_view_widget.dart';
import 'package:country_api_task/src/views/widgets/other_widgets/inner_page_indicator_widget.dart';
import 'package:country_api_task/src/views/widgets/other_widgets/row_of_next_and_previous_page_buttons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AgroMallTaskFullCountryDetailsWidget extends StatelessWidget {
  final AgroMallTaskCountryModel countryModel;
  
  const AgroMallTaskFullCountryDetailsWidget({
    super.key,
    required this.countryModel
  });

  @override
  Widget build(BuildContext context) {
    final listOfCountryParameters = countryModel.mapOfFields.entries.toList();
    final listOfLists = AgroMallTaskHelperFunctions.groupListItemsInFours(
      originalList: listOfCountryParameters
    );

    final listOfCoatOfArmsAndMapsUrl = [countryModel.coatOfArms, countryModel.googleMaps, countryModel.openStreetMaps];

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.hardEdge,
                children: [
                  Center(
                    child: AgroMallTaskCountryFlagDisplayWidget(
                      flagUrl: countryModel.flag,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  ),
                  
                  Center(
                    child: AgroMallTaskInnerPageViewWidget(
                      listOfCoatOfArmsAndMapsUrl: listOfCoatOfArmsAndMapsUrl,
                      countryName: countryModel.name
                    ),
                  ),

                  Center(child: AgroMallRowWithTowCircularButtonsWidget(country: countryModel.name)),

                  const Positioned(
                    bottom: 20,
                    child: AgroMallTaskInnerPageIndicatorWidget()
                  )
                ],
              ),
            ),
    
            const Gap(20),
            ... listOfLists.map(
              (listEntry){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ... listEntry.map(
                      (mapEntry) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            mapEntry.key.capitalize,
                            style: Theme.of(context).textTheme.titleMedium
                          ),
                          Text(
                            AgroMallTaskStrings.colon,
                            style: Theme.of(context).textTheme.headlineMedium
                          ),
                          const Gap(5),
                          Expanded(
                            child: Text(
                              maxLines: null,
                              mapEntry.value,
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontSize: AgroMallTaskFontSizes.size16,
                                fontWeight: AgroMallTaskFontWeights.regular
                              )
                            ),
                          )
                        ],
                      ) 
                    ),
                    const Gap(20)
                  ]
                );
              }
            )
          ],
        ),
      ),
    );
  }
}