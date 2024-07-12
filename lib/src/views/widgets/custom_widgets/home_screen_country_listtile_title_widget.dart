import 'package:country_api_task/src/models/country_data_model.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/textfield_search_string_provider.dart';
import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgroMallTaskHomeScreenCountryListTileTitleWidget extends ConsumerWidget {
  final AgroMallTaskCountryModel countryModel;

  const AgroMallTaskHomeScreenCountryListTileTitleWidget({
    super.key,
    required this.countryModel
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchKeyWord = ref.watch(textfieldSearchStringsProvider);
    final listOfStringsOfText = countryModel.name.trim().split(AgroMallTaskStrings.emptyString);

    return Text.rich(
      TextSpan(
        children: listOfStringsOfText.map(
          (stringOfText){
            final shouldHighlightString = searchKeyWord.contains(stringOfText.toLowerCase());
            return TextSpan(
              text: stringOfText,
              style: shouldHighlightString ? Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AgroMallTaskColors.lightThemeYellowButtonBgColor
              ) : Theme.of(context).textTheme.headlineMedium                                  
            );
          }
        ).toList()
      )
    );
  }
}