import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkBoxIsSelectedProvider = StateProvider.family<bool, String>(
  (_, __) => false
);