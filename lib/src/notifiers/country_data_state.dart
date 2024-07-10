import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:country_api_task/src/utils/helpers/extensions.dart';
import 'package:country_api_task/src/utils/helpers/helper_functions.dart';

class AgroMallTaskCountryModel{
  final String name,
    status,
    currencies,
    dialingCode,
    capital,
    alternativeSpellings,
    region,
    subregion,
    continent,
    languages,
    latlng,
    borders,
    area,
    flag,
    coatOfArms,
    population,
    googleMaps,
    openStreetMaps,
    carSide,
    carSign,
    postalCodeFormat,
    startOfWeek,
    timezones,
    isIndependent,
    landlocked,
    isUNMember;


  const AgroMallTaskCountryModel({
    required this.name,
    required this.status,
    required this.currencies,
    required this.dialingCode,
    required this.capital,
    required this.alternativeSpellings,
    required this.region,
    required this.subregion,
    required this.continent,
    required this.languages,
    required this.latlng,
    required this.borders,
    required this.area,
    required this.flag,
    required this.coatOfArms,
    required this.population,
    required this.googleMaps,
    required this.openStreetMaps,
    required this.carSide,
    required this.carSign,
    required this.postalCodeFormat,
    required this.startOfWeek,
    required this.timezones,
    required this.isIndependent,
    required this.landlocked,
    required this.isUNMember
  });

  factory AgroMallTaskCountryModel.fromJson({
    required Map<String, dynamic> json
  }) {
    final fetchedCapital = json[AgroMallTaskStrings.capital] as List<dynamic>;
    final capital = fetchedCapital.join(', ');

    final fetchedCurrencies = json[AgroMallTaskStrings.currencies];
    final currencies = AgroMallTaskHelperFunctions.getStringOfCurrenciesAndTheirData(fetchedCurrencies);

    final fetchedAlternativeCountrySpellings = json[AgroMallTaskStrings.alternativeSpellings] as List;
    final alternativeCountrySpellingsString = fetchedAlternativeCountrySpellings.join(', ');

    final fetchedContinents = json[AgroMallTaskStrings.continents] as List;
    final continent = fetchedContinents.first as String;

    final fetchedLanguages = json[AgroMallTaskStrings.languages] as Map;
    final laguages = fetchedLanguages.getStringOfLanguagesAndTheirDetails();

    final fetchedLatLng = json[AgroMallTaskStrings.latlng] as List;
    final latlng = fetchedLatLng.join(', ');

    final fetchedSubregion = json[AgroMallTaskStrings.subregion] as String;
    final subregion = fetchedSubregion.checkIfStringIsEmptyOrNull();

    final fetchedBorders = json[AgroMallTaskStrings.borders] as List;
    final borders = fetchedBorders.getStringFromListItems();

    final fetchedCoatOfArms = json[AgroMallTaskStrings.coatOfArms] as String;
    final coatOfArms = fetchedCoatOfArms.checkIfStringIsEmptyOrNull();

    final fetchedCarSign = json[AgroMallTaskStrings.car][AgroMallTaskStrings.carSigns];
    final carSign = fetchedCarSign.toString();

    final fetchedPostalCodeFormat = json[AgroMallTaskStrings.postalCodeFormat].toString();
    final postalCodeFormat = fetchedPostalCodeFormat.checkIfStringIsEmptyOrNull();

    final fetchedTimezones = json[AgroMallTaskStrings.timezones] as List;
    final timezones = fetchedTimezones.getStringFromListItems();


    return AgroMallTaskCountryModel(
      name: json[AgroMallTaskStrings.name] as String,
      status: json[AgroMallTaskStrings.status] as String,
      currencies: currencies,
      dialingCode: json[AgroMallTaskStrings.dialingCode].toString(),
      capital: capital,
      alternativeSpellings: alternativeCountrySpellingsString,
      region: json[AgroMallTaskStrings.region] as String,
      subregion: subregion,
      continent: continent,
      languages: laguages,
      latlng: latlng,
      borders: borders,
      area: json[AgroMallTaskStrings.area].toString(),
      flag: json[AgroMallTaskStrings.flag] as String,
      coatOfArms: coatOfArms,
      population: json[AgroMallTaskStrings.population].toString(),
      googleMaps: json[AgroMallTaskStrings.maps][AgroMallTaskStrings.googleMaps] as String,
      openStreetMaps: json[AgroMallTaskStrings.maps][AgroMallTaskStrings.googleMaps] as String,
      carSide: json[AgroMallTaskStrings.car][AgroMallTaskStrings.carSide],
      carSign: carSign,
      postalCodeFormat: postalCodeFormat,
      startOfWeek: json[AgroMallTaskStrings.startOfWeek] as String,
      timezones: timezones,
      isIndependent: json[AgroMallTaskStrings.independent].toString(),
      isUNMember: json[AgroMallTaskStrings.unMember].toString(),
      landlocked: json[AgroMallTaskStrings.landlocked].toString()
    );
  }
  

  Map<String, String> get mapOfFields =>
    {
      AgroMallTaskStrings.population: population,
      AgroMallTaskStrings.region: region,
      AgroMallTaskStrings.subregion: subregion,
      AgroMallTaskStrings.capital: capital,
      AgroMallTaskStrings.isIndependent: isIndependent,
      AgroMallTaskStrings.continent: continent,
      AgroMallTaskStrings.isUNMember: isUNMember,
      AgroMallTaskStrings.borders: borders,
      AgroMallTaskStrings.landlocked: landlocked,
      AgroMallTaskStrings.motto: AgroMallTaskStrings.dataNotAvailable,
      AgroMallTaskStrings.languages: languages,
      AgroMallTaskStrings.officialLanguage: AgroMallTaskStrings.dataNotAvailable,
      AgroMallTaskStrings.ethnicGroups: AgroMallTaskStrings.dataNotAvailable,
      AgroMallTaskStrings.religion: AgroMallTaskStrings.dataNotAvailable,
      AgroMallTaskStrings.government: AgroMallTaskStrings.dataNotAvailable,
      AgroMallTaskStrings.independence: AgroMallTaskStrings.dataNotAvailable,
      AgroMallTaskStrings.area: area,
      AgroMallTaskStrings.currencies: currencies,
      AgroMallTaskStrings.gdp: AgroMallTaskStrings.dataNotAvailable,
      AgroMallTaskStrings.latlng: latlng,
      AgroMallTaskStrings.timezones: timezones,
      AgroMallTaskStrings.dateFormat: AgroMallTaskStrings.dataNotAvailable,
      AgroMallTaskStrings.dialingCode: dialingCode,
      AgroMallTaskStrings.postalCodeFormat: postalCodeFormat,
      AgroMallTaskStrings.drivingSide: carSide,
      AgroMallTaskStrings.carSigns: carSign,
      AgroMallTaskStrings.alternativeSpellings: alternativeSpellings,
      AgroMallTaskStrings.startOfWeek: startOfWeek,
    };
}