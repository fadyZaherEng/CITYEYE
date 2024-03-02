import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class ConfirmButtonWidget extends StatelessWidget {
  final void Function() onTap;

  const ConfirmButtonWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 44,
      padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
      decoration: BoxDecoration(
        color: ColorSchemes.primary,
        borderRadius: BorderRadius.circular(6),
      ),
      child: MaterialButton(
        onPressed: onTap,
        child: Text(
          S.current.confirm,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ColorSchemes.white,
              ),
        ),
      ),
    );
  }
}
