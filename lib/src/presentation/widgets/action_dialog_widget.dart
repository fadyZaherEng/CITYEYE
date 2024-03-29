import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionDialogWidget extends StatelessWidget {
  final String text;
  final String icon;
  final String primaryText;
  final String secondaryText;
  final Function() primaryAction;
  final Function() secondaryAction;

  const ActionDialogWidget(
      {Key? key,
      required this.text,
      required this.icon,
      required this.primaryText,
      required this.secondaryText,
      required this.primaryAction,
      required this.secondaryAction})
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
          Visibility(
            visible: icon.isNotEmpty,
            child: SvgPicture.asset(
              icon,
              fit: BoxFit.scaleDown,
              width: 48,
              height: 48,
            ),
          ),
          Visibility(
              visible: icon.isNotEmpty,
              child: const SizedBox(
                height: 16.2,
              )),
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: ColorSchemes.black, letterSpacing: -0.24),
          ),
          const SizedBox(height: 32.0),
          Row(children: [
            Expanded(
              child: CustomButtonWidget(
                borderColor: ColorSchemes.gray,
                height: 44,
                onTap: secondaryAction,
                textColor: ColorSchemes.gray,
                backgroundColor: ColorSchemes.white,
                text: secondaryText,
              ),
            ),
            const SizedBox(
              width: 23,
            ),
            Expanded(
                child: CustomButtonWidget(
                    height: 44, onTap: primaryAction, text: primaryText)),
          ]),
        ],
      ),
    ));
  }
}
