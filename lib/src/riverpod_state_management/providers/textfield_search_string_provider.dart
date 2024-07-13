import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textfieldSearchStringsProvider = StateProvider.family<String, String>(
  (_, __) => AgroMallTaskStrings.emptyString
);