import 'package:country_api_task/src/views/widgets/custom_widgets/image_loading_error_widget.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    try{
      return SvgPicture.asset(
        svgPath,
        placeholderBuilder: (_) => const Center(
          child: AgroMallTaskShimmerWidget()
        ),
      );
    } catch(e){
      return const AgroMallTaskImageLoadingErrorWidget();
    }
  }
}