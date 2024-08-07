import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/image_loading_error_widget.dart';
import 'package:country_api_task/src/views/widgets/custom_widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AgroMallTaskCountryFlagDisplayWidget extends StatelessWidget {
  final String flagUrl;
  final BoxFit fit;
  final double? width, height;

  const AgroMallTaskCountryFlagDisplayWidget({
    super.key,
    required this.flagUrl,
    this.fit = BoxFit.contain,
    this.height = 40,
    this.width = 40
  });

  @override
  Widget build(BuildContext context) {
    try{
      return Hero(
        tag: flagUrl,
        createRectTween: (begin, end) {
          return RectTween(begin: begin, end: end);
        },
        flightShuttleBuilder: (flightContext, animation, direction, fromContext, toContext) {
          return ScaleTransition(
            scale: animation.drive(Tween<double>(begin: 0.0, end: 1.0)),
            child: fromContext.widget,
          );
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          height: height,
          width: width,
          child: SvgPicture.network(
            flagUrl,
            fit: fit,
            placeholderBuilder: (_) => const AgroMallTaskShimmerWidget(),
          ),
        ),
      );
    }
    catch (_){
      return const AgroMallTaskImageLoadingErrorWidget(errorText: AgroMallTaskStrings.emptyString);
    }
  }
}
