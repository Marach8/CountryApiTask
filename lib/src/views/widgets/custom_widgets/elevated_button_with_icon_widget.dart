import 'package:country_api_task/src/providers/countries_data_provider.dart';
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
    final countryDataModels = countryDataState.data;
    final countriesDataHasBeenFetched = countryDataModels?.isNotEmpty ?? false;
    
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(fixedSize: Size(buttonWidth, 40)),
      onPressed: countriesDataHasBeenFetched ? onPressed : null,
      icon: Icon(icon),
      label: Text(label),
    );
  }
}