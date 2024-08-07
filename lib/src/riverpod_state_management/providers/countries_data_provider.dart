import 'package:country_api_task/src/models/application_data_state.dart';
import 'package:country_api_task/src/riverpod_state_management/notifiers/data_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countriesDataStateProvider = StateNotifierProvider<AgroMallTaskDataStateNotifier, AgroMallTaskDataState>(
  (ref){
    final countriesDataStateNotifier = AgroMallTaskDataStateNotifier(ref: ref);
    countriesDataStateNotifier.fetchCountriesData();
    return countriesDataStateNotifier;
  }
);