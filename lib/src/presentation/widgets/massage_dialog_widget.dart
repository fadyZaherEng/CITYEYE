import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageDialogWidget extends StatelessWidget {
  final String text;
  final String icon;
  Color? iconColor;
  final String buttonText;
  final Function() onTap;

  MessageDialogWidget(
      {Key? key,
      required this.text,
      required this.icon,
      this.iconColor,
      required this.buttonText,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorSchemes.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              fit: BoxFit.scaleDown,
              width: 48,
              height: 48,
            ),
            const SizedBox(height: 16.2),
            Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: ColorSchemes.black, letterSpacing: -0.24),
            ),
            const SizedBox(height: 32.0),
            CustomButtonWidget(
              width: 150,
              height: 44,
              onTap: onTap,
              textColor: ColorSchemes.white,
              backgroundColor: ColorSchemes.primary,
              text: buttonText,
            ),
          ],
        ),
      ),
    );
  }
}
