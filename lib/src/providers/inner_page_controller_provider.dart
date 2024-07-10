import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final innerPageControllerProvider = StateProvider.autoDispose<PageController>(
  (_) => PageController()
);