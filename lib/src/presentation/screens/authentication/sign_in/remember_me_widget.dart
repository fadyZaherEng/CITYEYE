import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class RememberMeWidget extends StatelessWidget {
  final bool isCheckRememberMe;
  final Function() onTap;
  final void Function(bool value) onChange;

  const RememberMeWidget({
    Key? key,
    required this.isCheckRememberMe,
    required this.onTap,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              side: const BorderSide(
                color: ColorSchemes.lightGray,
              ),
              activeColor: ColorSchemes.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                4,
              )),
              tristate: true,
              value: isCheckRememberMe,
              onChanged: (value) {
                onChange(!isCheckRememberMe);
              }),
          Text(
            S.of(context).rememberMe,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ColorSchemes.gray,
                  letterSpacing: -0.13,
                  fontSize: 16,
                ),
          ),
        ],
      ),
    );
  }
}
