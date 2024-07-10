import 'package:flutter_riverpod/flutter_riverpod.dart';

final innerPageIndexProvider = StateProvider.family<int, String>(
  (_, __) => 0
);