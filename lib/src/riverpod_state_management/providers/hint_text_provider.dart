import 'package:country_api_task/src/utils/constants/enums.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hintTextProvider = StateProvider<String>(
  (_) => AgroMallTaskStrings.search + SearchQueryChoice.country.name
);