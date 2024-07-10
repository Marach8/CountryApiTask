import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AgroMallTaskShimmerWidget extends StatelessWidget {
  const AgroMallTaskShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        period: const Duration(seconds: 1),
        baseColor: AgroMallTaskColors.darkThemeGray300Color,
        highlightColor: AgroMallTaskColors.lightThemeGrey500Color,
        child: Container(
          color: AgroMallTaskColors.lightThemeBgColor
        ),
      ),
    );
  }
}