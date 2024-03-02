import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/presentation/widgets/custom_home_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/theme/color_schemes.dart';
import '../../../../core/resources/image_paths.dart';

class CheckingToggleButtonWidget extends StatelessWidget {
  final Function() onPressCheckIn;
  final Function() onPressCheckOut;

  const CheckingToggleButtonWidget({
    super.key,
    required this.onPressCheckIn,
    required this.onPressCheckOut,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: ColorSchemes.primaryWithOpacity,
                  blurRadius: 24.0,
                  offset: Offset(0, 4),
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: CustomHomeButtonWidget(
              onTap: onPressCheckIn,
              text: S.of(context).checkIn,
              prefixIcon: Flexible(
                child: SvgPicture.asset(
                  ImagePaths.firstCheckIn,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: ColorSchemes.redErrorWithOpacity,
                  blurRadius: 24.0,
                  offset: Offset(0, 4),
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: CustomHomeButtonWidget(
              backgroundColor: ColorSchemes.red,
              onTap: onPressCheckOut,
              text: S.of(context).checkOut,
              prefixIcon: Flexible(
                child: SvgPicture.asset(
                  ImagePaths.firstCheckOut,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
