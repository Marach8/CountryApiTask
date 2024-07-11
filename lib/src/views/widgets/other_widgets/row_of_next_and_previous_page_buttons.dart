import 'package:country_api_task/src/riverpod_state_management/providers/countries_data_provider.dart';
import 'package:country_api_task/src/riverpod_state_management/providers/inner_page_view_index_provider.dart';
import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgroMallRowWithTwoCircularButtonsWidget extends ConsumerWidget {
  final String country;
  
  const AgroMallRowWithTwoCircularButtonsWidget({
    super.key,
    required this.country
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //get the innerPageIndexProvider for each country being displayed
    final innerPageIndex = ref.watch(innerPageIndexProvider(country));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: innerPageIndex != 0,
            child: GestureDetector(
              onTap: () => ref.read(countriesDataStateProvider.notifier).goToPreviousInnerPage(),
                  
              child: Container(
                alignment: Alignment.center,
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AgroMallTaskColors.lightThemeGrey500Color
                ),
                child: Icon(
                  Icons.keyboard_arrow_left_sharp,
                  color: AgroMallTaskColors.lightThemeBgColor
                )
              ),
            ),
          ),

          Visibility(
            visible: innerPageIndex != 2,
            child: GestureDetector(
              onTap: () => ref.read(countriesDataStateProvider.notifier).goToNextInnerPage(),
                  
              child: Container(
                alignment: Alignment.center,
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AgroMallTaskColors.lightThemeGrey500Color
                ),
                child: Icon(
                  Icons.keyboard_arrow_right_sharp,
                  color: AgroMallTaskColors.lightThemeBgColor
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}