import 'package:country_api_task/src/riverpod_state_management/providers/countries_data_provider.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/country_flag_display_widget.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/home_screen_country_listtile_subtitle_widget.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/home_screen_country_listtile_title_widget.dart';
import 'package:country_api_task/src/views/widgets/other_widgets/home_screen_on_network_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgroMallTaskHomeWidget extends ConsumerWidget {
  const AgroMallTaskHomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countriesDataState = ref.watch(countriesDataStateProvider);

    if(countriesDataState.isLoading){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    else if(countriesDataState.error != null){
      if(countriesDataState.error == AgroMallTaskStrings.noMatchesFound){
        return Center(
          child: Text(
            AgroMallTaskStrings.noMatchesFound,
            style: Theme.of(context).textTheme.headlineMedium
          ),
        );
      }
      else{
        return const Center(child: AgroMallTaskHomeScreenOnNetworkErrorWidget());
      }
    }

    final generalMap = ref.watch(countriesDataStateProvider.notifier).sortedCountriesWithTheirInitialAlphabets();

    return ListView.builder(
      itemCount: generalMap.length,
      itemBuilder: (_, listIndex){
        final mapKey = generalMap.keys.elementAt(listIndex);

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                mapKey.toUpperCase(),
                style: Theme.of(context).textTheme.bodyMedium
              ),
            ),

            ...generalMap[mapKey]!.map(
              (listEntry) => ListTile(
                onTap: () => ref.read(countriesDataStateProvider.notifier).displayFullDetailsOfATappedCountry(
                  context: context,
                  countryModel: listEntry
                ),
                
                contentPadding: EdgeInsets.zero,
                title: AgroMallTaskHomeScreenCountryListTileTitleWidget(nameOfCountry: listEntry.name),
                subtitle: AgroMallTaskHomeScreenCountryListTileSubtitleWidget(capitalOfCountry: listEntry.capital),
                leading: AgroMallTaskCountryFlagDisplayWidget(
                  flagUrl: listEntry.flag,
                  fit: BoxFit.cover,
                )
              )
            )
          ],
        );
      },
    );
  }
}