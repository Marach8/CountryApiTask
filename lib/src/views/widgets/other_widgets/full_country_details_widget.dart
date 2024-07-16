import 'package:country_api_task/src/models/country_data_model.dart';
import 'package:country_api_task/src/utils/constants/font_sizes.dart';
import 'package:country_api_task/src/utils/constants/font_weights.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:country_api_task/src/utils/helpers/extensions.dart';
import 'package:country_api_task/src/utils/helpers/helper_functions.dart';
import 'package:country_api_task/src/views/widgets/other_widgets/animated_images_stack.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';

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
            FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 2000)),
              builder: (_, snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
                  return AgroMallTaskFullCountryDetailsAnimatedStack(
                    countryModel: countryModel,
                    listOfCoatOfArmsAndMapsUrl: listOfCoatOfArmsAndMapsUrl,
                  );
                }
                else{
                  return const SizedBox.shrink();
                }
              }
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
                            child: ReadMoreText(
                              mapEntry.value,
                              trimMode: TrimMode.Length,
                              trimExpandedText: AgroMallTaskStrings.showLess,
                              trimLength: 8,
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