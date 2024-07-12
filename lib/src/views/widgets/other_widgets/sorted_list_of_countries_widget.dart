import 'package:country_api_task/src/riverpod_state_management/providers/countries_data_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/outer_page_view_index_provider.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:country_api_task/src/views/screens/full_country_detail_screen.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/country_flag_display_widget.dart';
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
                onTap: () {
                  final sortedListOfCountryModels = ref.read(countriesDataStateProvider.notifier).getSortedListOfCountryModels();
                  final index = sortedListOfCountryModels.indexOf(listEntry);
                  ref.read(outerPageIndexProvider.notifier).state = index;

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AgroMallTaskFullCountryDetailScreen(
                        indexOfTappedCountry: index,
                      )
                    )
                  );
                },
                contentPadding: EdgeInsets.zero,
                title: Text(
                  listEntry.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                subtitle: Text(
                  listEntry.capital,
                  style: Theme.of(context).textTheme.bodyMedium
                ),
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