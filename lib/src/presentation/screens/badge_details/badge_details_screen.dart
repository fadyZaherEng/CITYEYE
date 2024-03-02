// ignore_for_file: use_build_context_synchronously

import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/utils/make_call.dart';
import 'package:city_eye/src/domain/entities/home/security/badge_scanned.dart';
import 'package:city_eye/src/domain/entities/home/security/user_unit_info.dart';
import 'package:city_eye/src/presentation/screens/badge_details/widgets/badge_details_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BadgeDetailsScreen extends BaseStatefulWidget {
  final bool isValid;
  final BadgeScanned badgeScanned;
  final UserUnitInfo userUnitInfo;

  const BadgeDetailsScreen({
    super.key,
    required this.isValid,
    required this.badgeScanned,
    required this.userUnitInfo,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends BaseState<BadgeDetailsScreen> {
  @override
  Widget baseBuild(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                color: ColorSchemes.primary,
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(40.0),
                  topEnd: Radius.circular(40.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorSchemes.notificationShadow,
                    spreadRadius: 0.0,
                    blurRadius: 32.0,
                    offset: Offset(0, 4),
                  )
                ],
              ),
            ),
            BadgeDetailsCardWidget(
              isValid: widget.isValid,
              userUnitInfo: widget.userUnitInfo,
              badgeScanned: widget.badgeScanned,
              onPressedCall: () {
                makingPhoneCall(widget.userUnitInfo.user.mobile);
              },
            ),
          ],
        ),
      ),
    );
  }
}
