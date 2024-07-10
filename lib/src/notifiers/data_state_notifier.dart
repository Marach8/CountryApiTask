import 'package:country_api_task/src/models/country_data_state_model.dart';
import 'package:country_api_task/src/notifiers/country_data_state.dart';
import 'package:country_api_task/src/services/api_service.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:country_api_task/src/utils/helpers/helper_functions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AgroMallTaskDataStateNotifier extends StateNotifier<AgroMallTaskDataState>{
  AgroMallTaskDataStateNotifier(): super(AgroMallTaskDataState.isLoading());

  List<AgroMallTaskCountryModel> _cachedCountryModels = [];
  
  final Map<String, Map<String, bool>> _statusOfCheckedBoxes = {};

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


  // Map<String, bool>? getExpansionTileCheckBoxesData(String titleOfExpansionTile)
  //   => _filterCheckBoxesStatus[titleOfExpansionTile];

  void showSelectedFilterResults(){
    state = state = AgroMallTaskDataState.isLoading();

    final continentTileMap = _statusOfCheckedBoxes[AgroMallTaskStrings.continent];
    final timezoneTileMap = _statusOfCheckedBoxes[AgroMallTaskStrings.continent];

    //get all the selected continents in the Continent Expansion Tile
    final listOfSelectedContinents = continentTileMap?.keys.where(
      (key) => continentTileMap[key] == true
    ).toList();

    //get all the selected timezones in the Timezone Expansion Tile
    final listOfSelectedTimezones = timezoneTileMap?.keys.where(
      (key) => timezoneTileMap[key] == true
    ).toList();

    final matchingCountryModels = _cachedCountryModels.where(
      (countryModel){
        final continent = countryModel.continent;
        final listOfTimezones = countryModel.timezones.split(AgroMallTaskStrings.comma);
        final timezoneIsInSelectedTimeZones = AgroMallTaskHelperFunctions.checkForCommonElementInTwoLists(
          list1: listOfSelectedTimezones ?? [], 
          list2: listOfTimezones
        );

        final continentIsInSelectedContinents = listOfSelectedContinents?.contains(continent);

        return continentIsInSelectedContinents ?? false || timezoneIsInSelectedTimeZones;
      }
    ).toList();

    state = AgroMallTaskDataState.hasData(data: matchingCountryModels);
  }


  void setCheckboxTileValue({
    required String titleOfExpansionTile,
    required String titleOfCheckBoxTile,
    required bool valueToBeSet
  }) {
    if(_statusOfCheckedBoxes[titleOfExpansionTile] != null){
      _statusOfCheckedBoxes[titleOfExpansionTile]?[titleOfCheckBoxTile] = valueToBeSet;
      
    }
    else{
      final newCheckboxData = {titleOfCheckBoxTile: valueToBeSet};
      _statusOfCheckedBoxes.putIfAbsent(titleOfExpansionTile, () => newCheckboxData);
    }
    
  } 


  void filterCountriesBySearchKey(String searchKey){
    //ensure that there is data before accessing it for filtering
    //state.data is used instead of cachedCountryModels for the check to ensure 
    // that filtering can only occure when the application is in its data state
    if(state.data?.isNotEmpty ?? false){
      state = AgroMallTaskDataState.isLoading();

      if(searchKey.isNotEmpty){
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
        state = AgroMallTaskDataState.hasData(data: _cachedCountryModels);
      }
    }
    
  }


  List<AgroMallTaskCountryModel> getSortedListOfCountryModels(){
    final copyOfData = [...?state.data];
    copyOfData.sort(
      (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase())
    );

    return copyOfData;
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


  Map<String, List<AgroMallTaskCountryModel>> sortCountriesWithTheirInitialAlphabets(){
    final sortedListOfCountryModels = getSortedListOfCountryModels();
    
    Map<String, List<AgroMallTaskCountryModel>> generalMap = {};
    List<String> listOfInitialAlphabets = [];

    for(AgroMallTaskCountryModel countryModel in sortedListOfCountryModels){
      final initialAlphabet = countryModel.name.split(AgroMallTaskStrings.emptyString).first.toLowerCase();
      if(!listOfInitialAlphabets.contains(initialAlphabet)){
        listOfInitialAlphabets.add(initialAlphabet);
      }
    }

    for(AgroMallTaskCountryModel countryModel in sortedListOfCountryModels){
      final initialAlphabet = countryModel.name.split(AgroMallTaskStrings.emptyString).first.toLowerCase();
      if(!generalMap.containsKey(initialAlphabet)){
        generalMap[initialAlphabet] = [];
        generalMap[initialAlphabet]?.add(countryModel);
      }
      else{
        generalMap[initialAlphabet]?.add(countryModel);
      }
    }

    return generalMap;
  }
  
}