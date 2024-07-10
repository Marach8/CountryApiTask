import 'package:country_api_task/src/riverpod_state_management/notifiers/country_data_state.dart';

class AgroMallTaskDataState {
  final bool isLoading;
  final List<AgroMallTaskCountryModel>? data;
  final String? error;

  AgroMallTaskDataState({
    this.isLoading = false,
    this.data,
    this.error
  });

  factory AgroMallTaskDataState.isLoading()
    => AgroMallTaskDataState(isLoading: true);

  factory AgroMallTaskDataState.hasData({required List<AgroMallTaskCountryModel> data})
    => AgroMallTaskDataState(data: data);

  factory AgroMallTaskDataState.hasError({required String error})
    => AgroMallTaskDataState(error: error);
}
