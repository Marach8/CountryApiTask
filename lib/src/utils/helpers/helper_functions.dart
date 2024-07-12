import 'package:country_api_task/src/models/country_data_model.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class AgroMallTaskHelperFunctions{
  const AgroMallTaskHelperFunctions._();

  static double getScreenWidth(BuildContext context)
    => MediaQuery.of(context).size.width;

  static double getScreenHeight(BuildContext context)
    => MediaQuery.of(context).size.height;

  static bool getDeviceMode(BuildContext context)
    => MediaQuery.of(context).platformBrightness == Brightness.dark;
    

  static String getStringOfCurrenciesAndTheirData(dynamic currencies){
    final List<String> listOfCurrenciesAndTheirDetails = [];

    if(currencies is Map){
      for(var currencyData in currencies.entries){
        final currencyAbbreviation = currencyData.key;

        final currencyDataValue = currencyData.value as Map;
        final currencyName = currencyDataValue[AgroMallTaskStrings.name];

        final currencySymbol = currencyDataValue[AgroMallTaskStrings.currencySymbol];
        
        //concatenate the country abbreviation, name and symbol into a single string
        final stringOfCurrencyDetails = '${AgroMallTaskStrings.abbreviation}:$currencyAbbreviation, ${AgroMallTaskStrings.name}: $currencyName, ${AgroMallTaskStrings.currencySymbol}: $currencySymbol';
        listOfCurrenciesAndTheirDetails.add(stringOfCurrencyDetails);
      }

      final stringOfListOfCurrenciesAndTheirDetails = listOfCurrenciesAndTheirDetails.join('||');
      return stringOfListOfCurrenciesAndTheirDetails;
    }
    else {
      return AgroMallTaskStrings.dataNotAvailable;
    }
  }


  static bool checkForCommonElementInTwoLists({
    required List<String> list1,
    required List<String> list2
  }){
    bool commonElementExists = false;
    for(var listItem in list1){
      if(list2.contains(listItem)){
        commonElementExists = true;
        break;
      }
    }
    return commonElementExists;
  }


  static List<List<MapEntry<String, String>>> groupListItemsInFours({
    required List<MapEntry<String, String>> originalList
  }){
    List<List<MapEntry<String, String>>> listOfLists = [];
    List<MapEntry<String, String>> listOfFour = [];

    for(var item in originalList){
      listOfFour.add(item);

      if(listOfFour.length == 4){
        listOfLists.add(listOfFour);
        listOfFour = [];
      }
    }

    if(listOfFour.isNotEmpty){
      listOfLists.add(listOfFour);
    }

    return listOfLists;
  }


  static Map<String, List<AgroMallTaskCountryModel>> sortCountriesAccordingToTheirInitialAlphabets({
    required List<AgroMallTaskCountryModel> listOfCountriesToSort
  }){
    Map<String, List<AgroMallTaskCountryModel>> generalMap = {};
    List<String> listOfInitialAlphabets = [];

    for(AgroMallTaskCountryModel countryModel in listOfCountriesToSort){
      final initialAlphabet = countryModel.name.split(AgroMallTaskStrings.emptyString).first.toLowerCase();
      if(!listOfInitialAlphabets.contains(initialAlphabet)){
        listOfInitialAlphabets.add(initialAlphabet);
      }
    }

    for(AgroMallTaskCountryModel countryModel in listOfCountriesToSort){
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


  static List<AgroMallTaskCountryModel> filterCountriesAccordingToContinentsAndOrTimezones({
    required List<String> listOfContinentsForFiltering,
    required List<String> listOfTimezonesForFiltering,
    required List<AgroMallTaskCountryModel> listOfCountriesToBeFiltered
  }){
    final matchingCountryModels = listOfCountriesToBeFiltered.where(
      (countryModel){
        final continent = countryModel.continent;
        final listOfTimezones = countryModel.timezones.split(AgroMallTaskStrings.comma);

        final timezoneIsInSelectedTimeZones = AgroMallTaskHelperFunctions.checkForCommonElementInTwoLists(
          list1: listOfTimezonesForFiltering, 
          list2: listOfTimezones
        );

        final continentIsInSelectedContinents = listOfContinentsForFiltering.contains(continent);

        return continentIsInSelectedContinents || timezoneIsInSelectedTimeZones;
      }
    ).toList();

    return matchingCountryModels;
  }
}