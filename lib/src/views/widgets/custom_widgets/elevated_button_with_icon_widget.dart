import 'package:country_api_task/src/riverpod_state_management/providers/countries_data_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/text_field_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgroMallTaskElevatedButtonWithIconWidget extends ConsumerWidget {
  final void Function()? onPressed;
  final IconData icon;
  final String label;
  final double buttonWidth;

  const AgroMallTaskElevatedButtonWithIconWidget({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.buttonWidth = 73
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countryDataState = ref.watch(countriesDataStateProvider);
    final textfieldController = ref.watch(textfieldControllerProvider);
    final textfieldIsEmpty = textfieldController.text.isEmpty;
    final countryDataModels = countryDataState.data;
    final enableButton = (countryDataModels?.isNotEmpty ?? false) && textfieldIsEmpty;
    
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(fixedSize: Size(buttonWidth, 40)),
      onPressed: enableButton ? onPressed : null,
      icon: Icon(icon),
      label: Text(label),
    );
  }
}