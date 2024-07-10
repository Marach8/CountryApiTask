import 'package:country_api_task/src/utils/constants/strings.dart';

extension GetStringFromMap<T, S> on Map<T, S>{
  String getStringOfLanguagesAndTheirDetails(){
    final listOfStringsOfLanguages = [];

    for(var language in entries){
      final abbreviation = language.key;
      final fullName = language.value;
      
      final stringOfLanguages = '${AgroMallTaskStrings.abbreviation}:$abbreviation, ${AgroMallTaskStrings.fullName}:$fullName';
      listOfStringsOfLanguages.add(stringOfLanguages);
    }

    final stringOfLanguages = listOfStringsOfLanguages.join(' || ');
    return stringOfLanguages;
  }
}


extension CheckString on String{
  String checkIfStringIsEmptyOrNull(){
    if(length == 0 || this == AgroMallTaskStrings.nullString){
      return AgroMallTaskStrings.dataNotAvailable;
    }
    return this;
  }
}


extension CheckList<T> on List<T>{
  String getStringFromListItems(){
    if(isEmpty){
      return AgroMallTaskStrings.dataNotAvailable;
    }
    return join(', ');
  }
}


// extension ResetBooleanValues<T, S> on Map<T, Map<T, bool>>{
//   void resetAllTrueValuesToFalse(){
//     for(var map in values){
//       for(bool status in map.values){
//         if(status){
//           status = false;
//         }
//       }
//     }
//   }
// }

extension CapitalizeAWord on String{
  String get capitalize => this[0].toUpperCase() + substring(1).toLowerCase();
}