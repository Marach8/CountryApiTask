import 'package:country_api_task/src/riverpod_state_management/providers/inner_page_controller_provider.dart';
import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AgroMallTaskInnerPageIndicatorWidget extends ConsumerWidget {
  const AgroMallTaskInnerPageIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(innerPageControllerProvider);

    return SmoothPageIndicator(
      controller: controller,
      onDotClicked: (index) => ref.read(innerPageControllerProvider.notifier).state.jumpToPage(index),
      count: 3,
      effect: WormEffect(
        activeDotColor: AgroMallTaskColors.darkThemeGray200Color,
        dotHeight: 6,
        dotColor: AgroMallTaskColors.dotIndicatorColor,
        spacing: 4,
        dotWidth: 6
      ),
    );
  }
}