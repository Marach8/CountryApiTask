import 'package:country_api_task/src/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AgroMallTaskElevatedButtonWidget extends StatelessWidget {
  final String childText;
  final double width;
  final Color? color;
  final void Function()? onPressed;

  const AgroMallTaskElevatedButtonWidget({
    super.key,
    required this.childText,
    required this.onPressed,
    this.width = 90,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, 48),
        backgroundColor: color ?? AgroMallTaskColors.transparentColor
      ),
      child: Text(childText),
    );
  }
}