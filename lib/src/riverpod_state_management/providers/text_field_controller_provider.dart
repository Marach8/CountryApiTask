import 'package:country_api_task/src/riverpod_state_management/providers/countries_data_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/snack_bar_is_mounted_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textfieldControllerProvider = StateProvider.autoDispose<TextEditingController>(
  (ref){
    final controller = TextEditingController();
    //final snackBarIsMounted = ref.watch(snackBarIsMountedProvider);
    
    // if(snackBarIsMounted){
    //   controller.clear();
    // }
    
    return controller;
  }
);