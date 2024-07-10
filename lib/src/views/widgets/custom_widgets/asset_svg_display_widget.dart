import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class AgroMallTaskAssetSvgDisplayWidget extends StatelessWidget {
  final String svgPath;
  final BoxFit fit;

  const AgroMallTaskAssetSvgDisplayWidget({
    super.key,
    required this.svgPath,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      placeholderBuilder: (_) => Center(
        child: Shimmer.fromColors(
          baseColor: AgroMallTaskColors.darkThemeGray300Color,
          highlightColor: AgroMallTaskColors.lightThemeGrey500Color,
          child: Container(
            color: AgroMallTaskColors.lightThemeBgColor
          ),
        ),
      ),
    );
  }
}