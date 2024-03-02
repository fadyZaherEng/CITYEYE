import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class MaintainanceEmptyWidget extends StatelessWidget {
  const MaintainanceEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 188,
        width: 188,
        margin: const EdgeInsets.only(top: 65),
        decoration: BoxDecoration(
          color: ColorSchemes.white,
          borderRadius: BorderRadius.circular(200),
        ),
        child: Center(
          child: Text(
            S.of(context).thereAreNoRequests,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: ColorSchemes.gray,
                ),
          ),
        ),
      ),
    );
  }
}
