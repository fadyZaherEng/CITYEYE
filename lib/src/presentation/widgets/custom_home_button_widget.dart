import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomHomeButtonWidget extends StatelessWidget {
  final void Function() onTap;
  final String text;
  final double fontSize;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double height;
  final double buttonBorderRadius;
  final FontWeight fontWeight;
  final Widget prefixIcon;
  final TextStyle? customTextStyle;
  final double spaceBetweenIconAndText;

  const CustomHomeButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
    this.backgroundColor = ColorSchemes.primary,
    this.textColor = ColorSchemes.white,
    this.height = 48,
    this.borderColor = Colors.transparent,
    this.buttonBorderRadius = 12,
    this.fontWeight = Constants.fontWeightSemiBold,
    this.prefixIcon = const SizedBox.shrink(),
    this.fontSize = 16.0,
    this.customTextStyle,
    this.spaceBetweenIconAndText = 6.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle>(
            Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: textColor,
                ),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(buttonBorderRadius),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.zero,
          ),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: borderColor,
              width: 1,
            ),
          ),
        ),
        onPressed: onTap,
        child: Padding(
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              prefixIcon,
              SizedBox(
                width: spaceBetweenIconAndText,
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: Text(
                  text,
                  style: customTextStyle ??
                      Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: textColor,
                            letterSpacing: -0.14,
                            fontWeight: fontWeight,
                            fontSize: fontSize,
                          ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
