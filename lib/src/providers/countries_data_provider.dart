import 'package:country_api_task/src/models/country_data_state_model.dart';
import 'package:country_api_task/src/notifiers/data_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countriesDataStateProvider = StateNotifierProvider<AgroMallTaskDataStateNotifier, AgroMallTaskDataState>(
  (ref){
    final countriesDataStateNotifier = AgroMallTaskDataStateNotifier();
    countriesDataStateNotifier.fetchCountriesData();
    return countriesDataStateNotifier;
  }
);