import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textfieldControllerProvider = StateProvider.autoDispose<TextEditingController>(
  (_) => TextEditingController()
);