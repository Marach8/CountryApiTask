import 'package:country_api_task/src/riverpod_state_management/providers/hint_text_provider.dart';
import 'package:country_api_task/src/utils/constants/enums.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgroMallTaskSearchTermSelectionDropDownWidget extends StatelessWidget {
  const AgroMallTaskSearchTermSelectionDropDownWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    final ref = ProviderScope.containerOf(context);

    return PopupMenuButton<String>(
      offset: const Offset(0, 50),
      onSelected: (selectedSearchChoice) 
        => ref.read(hintTextProvider.notifier).state = AgroMallTaskStrings.search + selectedSearchChoice,
      icon: const Icon(
        Icons.keyboard_arrow_down_outlined,
        size: 25,
      ),
      itemBuilder: (_) => SearchQueryChoice.values.map(
        (searchChoice) => PopupMenuItem<String>(
          height: 40,
          value: searchChoice.name,
          child: Text(
            searchChoice.name,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        )
      ).toList()
    );
  }
}