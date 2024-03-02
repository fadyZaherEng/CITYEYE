import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class ServiceSubscriptionEmptyWidget extends StatelessWidget {
  const ServiceSubscriptionEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 318,
      child: Center(
        child: Container(
          height: 188,
          width: 188,
          decoration: BoxDecoration(
              color: ColorSchemes.dashboardEmptyStates,
              borderRadius: BorderRadius.circular(200),
              border: Border.all(
                color: ColorSchemes.white,
                width: 20,
              )),
          child: Center(
            child: Text(
              S.of(context).thereAreNoSubscriptions,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: ColorSchemes.gray,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
