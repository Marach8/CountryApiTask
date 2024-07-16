import 'package:country_api_task/src/riverpod_state_management/providers/hint_text_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/popup_button_provider.dart';
import 'package:country_api_task/src/utils/constants/enums.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgroMallTaskSearchTermSelectionDropDownWidget extends ConsumerWidget {
  const AgroMallTaskSearchTermSelectionDropDownWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popupController = ref.watch(popupControllerProvider);    

    return PopupMenuButton<String>(
      enabled: popupController != 2,
      onOpened: () => ref.read(popupControllerProvider.notifier).state = 1,
      onCanceled: () => ref.read(popupControllerProvider.notifier).state = 0,
      offset: const Offset(0, 50),
      onSelected: (selectedSearchChoice){
        ref.read(hintTextProvider.notifier).state = AgroMallTaskStrings.search + selectedSearchChoice;
        ref.read(popupControllerProvider.notifier).state = 0;
      },
      icon: AnimatedCrossFade(
        firstChild: const Icon(Icons.keyboard_arrow_down_outlined, size: 25),
        secondChild: const Icon(Icons.keyboard_arrow_up_outlined, size: 25),
        crossFadeState: popupController != 1 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        firstCurve: Curves.decelerate,
        secondCurve: Curves.decelerate,
        sizeCurve: Curves.decelerate,
        duration: const Duration(seconds: 2),
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