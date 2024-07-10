import 'package:flutter_riverpod/flutter_riverpod.dart';

final expansionTileIsExpandedProvider = StateProvider.family<bool, String>(
  (_, __) => false
);