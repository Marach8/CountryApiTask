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