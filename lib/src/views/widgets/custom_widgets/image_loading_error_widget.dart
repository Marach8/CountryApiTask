import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:country_api_task/src/utils/constants/font_weights.dart';
import 'package:country_api_task/src/utils/constants/strings.dart';
import 'package:flutter/material.dart';

class AgroMallTaskImageLoadingErrorWidget extends StatelessWidget {
  final String errorText;
  const AgroMallTaskImageLoadingErrorWidget({
    super.key,
    this.errorText = AgroMallTaskStrings.dataNotAvailable
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorText,
        maxLines: null,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: AgroMallTaskColors.warningColor,
          fontWeight: AgroMallTaskFontWeights.bold
        ),
      ),
    );
  }
}