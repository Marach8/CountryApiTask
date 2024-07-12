import 'package:country_api_task/src/models/country_data_state_model.dart';
import 'package:country_api_task/src/models/country_data_model.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/expansion_tile_state_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/inner_page_controller_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/number_of_checkbox_ticks_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/outer_page_view_index_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/selected_check_box_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/textfield_search_string_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/theme_mode_provider.dart';
import 'package:country_api_task/src/services/api_service.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:country_api_task/src/utils/helpers/helper_functions.dart';
import 'package:country_api_task/src/views/screens/full_country_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AgroMallTaskDataStateNotifier extends StateNotifier<AgroMallTaskDataState>{
  final Ref ref;

  AgroMallTaskDataStateNotifier({required this.ref}): super(AgroMallTaskDataState.isLoading());

  List<AgroMallTaskCountryModel> _cachedCountryModels = [];


  Future<void> fetchCountriesData() async{
    try{
      state = AgroMallTaskDataState.isLoading();
      final apiService = AgroMallTaskApiService();
      final countriesData = await apiService.fetchCountryModels();
      //cache the countryDetailsInformation immediately on retrieval
      _cachedCountryModels = countriesData;
      state = AgroMallTaskDataState.hasData(data: countriesData);
    }
    catch (e) {
      state = AgroMallTaskDataState.hasError(error: e.toString());
    }
  }


  void changeToDarkMode() => ref.read(themeModeProvider.notifier).state = ThemeMode.dark;


  void changeToLightMode() => ref.read(themeModeProvider.notifier).state = ThemeMode.light;


  void showSelectedFilterResults(BuildContext context){
    //Hide the snackbar, react to the closure of the expansion tiles,
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ref.read(expansionTileIsExpandedProvider(AgroMallTaskStrings.continent).notifier).state = false;
    ref.read(expansionTileIsExpandedProvider(AgroMallTaskStrings.timezone).notifier).state = false;

    //get all the continents and timezones and start loading
    final listOfContinents = getContinents();
    final listOfTimezones = getTimezones();

    state = AgroMallTaskDataState.isLoading();

    //get all the checked continent and timezone tiles
    final listOfCheckedContinentTiles = listOfContinents.where(
      (continent) => ref.read(checkBoxIsSelectedProvider(continent).notifier).state == true
    ).toList();

    final listOfCheckedTimezoneTiles = listOfTimezones.where(
      (timezone) => ref.read(checkBoxIsSelectedProvider(timezone).notifier).state == true
    ).toList();

    //get all the countries that match either the checked continent tiles(if any) or timezone tiles(if any)
    
    final matchingCountryModels = AgroMallTaskHelperFunctions.filterCountriesAccordingToContinentsAndOrTimezones(
      listOfContinentsForFiltering: listOfCheckedContinentTiles,
      listOfTimezonesForFiltering: listOfCheckedTimezoneTiles,
      listOfCountriesToBeFiltered: _cachedCountryModels
    );

    //inject this matching countries into the state
    state = AgroMallTaskDataState.hasData(data: matchingCountryModels);

    //ensure the checked boxes are unchecked after the process
    // unselectAllCheckboxes();
  }


  void unselectAllCheckboxes(){
    final continents = getContinents();
    final timezones = getTimezones();
    ref.read(numberOfCheckboxTicksProvider.notifier).state = 0;

    //reset the state of all checkboxes to their unselected state;
    for(var continent in continents){
      ref.read(checkBoxIsSelectedProvider(continent).notifier).state = false;
    }

    for(var timezone in timezones){
      ref.read(checkBoxIsSelectedProvider(timezone).notifier).state = false;
    }
  }


  void filterCountriesBySearchKey(String searchKey){
    //ensure that there is data before accessing it for filtering
    //state.data is used instead of cachedCountryModels for the check to ensure 
    // that filtering can only occure when the application is in its data state
    if((state.data?.isNotEmpty ?? false) || searchKey.isNotEmpty){
      state = AgroMallTaskDataState.isLoading();

      final searchResult = _cachedCountryModels.where(
        (country) => country.name.toLowerCase().contains(searchKey.toLowerCase())
      ).toList();

      if(searchResult.isEmpty){
        state = AgroMallTaskDataState.hasError(error: AgroMallTaskStrings.noMatchesFound);
      }
      else{
        state = AgroMallTaskDataState.hasData(data: searchResult);
      }
    }

    else{
      if(_cachedCountryModels.isNotEmpty){
        state = AgroMallTaskDataState.hasData(data: _cachedCountryModels);
      }
    }

    ref.read(textfieldSearchStringsProvider.notifier).state = searchKey.toLowerCase();
  }


  List<AgroMallTaskCountryModel> getSortedListOfCountryModels(){
    final copyOfData = [...?state.data];
    copyOfData.sort(
      (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase())
    );

    return copyOfData;
  }


  void updateOuterPageViewIndex(int currentIndex)
    => ref.read(outerPageIndexProvider.notifier).state = currentIndex;


  void goToPreviousInnerPage(){
    final pageController = ref.read(innerPageControllerProvider);
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease
    );
  }


  void goToNextInnerPage(){
    final pageController = ref.read(innerPageControllerProvider);
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease
    );
  }


  List<String> getContinents(){
    List<String> listOfContinents = [];
    final listOfCountryModels = _cachedCountryModels;

    for(var countryModel in listOfCountryModels){
      final continent = countryModel.region;
      if(!listOfContinents.contains(continent)){
        listOfContinents.add(continent);
      }
    }

    listOfContinents.sort(
      (a, b) => a.toLowerCase().compareTo(b.toLowerCase())
    );

    return listOfContinents;
  }
  

  void onCheckBoxTapped({
    required String checkedTile,
    required bool? currentValue
  }){
    if(currentValue ?? false){
      ref.read(numberOfCheckboxTicksProvider.notifier).state++;
    }
    else{
      ref.read(numberOfCheckboxTicksProvider.notifier).state--;
    }
    ref.read(checkBoxIsSelectedProvider(checkedTile).notifier).state = currentValue ?? false;
  }


  List<String> getTimezones(){
    List<String> listOfTimezones = [];
    final listOfCountryModels = state.data!;

    for(var countryModel in listOfCountryModels){
      final stringOfTimezones = countryModel.timezones;
      final timezonesInACountry = stringOfTimezones.split(AgroMallTaskStrings.comma);
      if(!listOfTimezones.contains(stringOfTimezones)){
        listOfTimezones.addAll(timezonesInACountry);
      }
    }

    listOfTimezones.sort(
      (a, b) => a.toLowerCase().compareTo(b.toLowerCase())
    );

    final setOfTimezones = listOfTimezones.toSet();

    return setOfTimezones.toList();
  }


  Map<String, List<AgroMallTaskCountryModel>> sortedCountriesWithTheirInitialAlphabets(){
    final sortedListOfCountryModels = getSortedListOfCountryModels();
    
    final sortedCountriesWithTheirInitialAlphabets = AgroMallTaskHelperFunctions.sortCountriesAccordingToTheirInitialAlphabets(
      listOfCountriesToSort: sortedListOfCountryModels
    );

    return sortedCountriesWithTheirInitialAlphabets;
  }


  void displayFullDetailsOfATappedCountry({
    required BuildContext context,
    required AgroMallTaskCountryModel countryModel
  }){
    final sortedListOfCountryModels = getSortedListOfCountryModels();
    final index = sortedListOfCountryModels.indexOf(countryModel);
    ref.read(outerPageIndexProvider.notifier).state = index;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AgroMallTaskFullCountryDetailScreen(
          indexOfTappedCountry: index,
        )
      )
    );
  }
  
}