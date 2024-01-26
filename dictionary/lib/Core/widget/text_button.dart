import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Theme_light/Theme_light_meth.dart';

class AppTextButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final Color borderColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final Widget buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final int? i;
  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    this.i=0,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 13.0).r,
            // side: BorderSide(
            //   color: borderColor ,
            //   width: 5.w , // Set your desired border width
            // ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        padding: MaterialStateProperty.all<EdgeInsets>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding!,
            vertical: verticalPadding!,
          ),
        ),
        fixedSize: MaterialStateProperty.all(
          Size(buttonWidth!, buttonHeight!),
        ),
      ),
      onPressed:i==0?null: onPressed,
      child:buttonText,

    );
  }
}
