import 'dart:convert';
import 'package:country_api_task/src/models/country_data_model.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:http/http.dart' as http;


class AgroMallTaskApiService{

  AgroMallTaskApiService._sharedInstance();
  static final _shared = AgroMallTaskApiService._sharedInstance();
  factory AgroMallTaskApiService() => _shared;

  Future<List<AgroMallTaskCountryModel>> fetchCountryModels() async{
    final url = Uri.parse(AgroMallTaskStrings.baseUrl);

    final response = await http.get(url);
    if(response.statusCode == 200){
      final List<dynamic> body = jsonDecode(response.body);

      final countryModels = body.map(
        (countryDataJson) {
          return AgroMallTaskCountryModel.fromJson(json: countryDataJson);
        }
      ).toList();
      return countryModels;
    }
    else{
      throw AgroMallTaskStrings.couldNotFetchData;
    }
  }

}