import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/domain/entities/home/security/delegation_scanned.dart';
import 'package:city_eye/src/domain/entities/home/security/user_unit_info.dart';
import 'package:city_eye/src/presentation/screens/delegation_details/widgets/delegation_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DelegationDetailsCardWidget extends StatelessWidget {
  final void Function() onPressedCall;
  final void Function() onDelegationButtonPressed;
  final bool isValid;
  final DelegationScanned delegationScanned;
  final UserUnitInfo userUnitInfo;

  const DelegationDetailsCardWidget({
    super.key,
    required this.onPressedCall,
    required this.onDelegationButtonPressed,
    required this.isValid,
    required this.delegationScanned,
    required this.userUnitInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 63.0),
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset(
                      ImagePaths.arrowLeft,
                      matchTextDirection: true,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    S.of(context).details,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ColorSchemes.white,
                          fontSize: 18.0,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            if (isValid) SvgPicture.asset(ImagePaths.doneSuccess),
            if (!isValid) SvgPicture.asset(ImagePaths.icWrog),
            const SizedBox(height: 32.0),
            Container(
              width: 350.0,
              constraints: const BoxConstraints(
                maxWidth: 350.0,
              ),
              decoration: const BoxDecoration(
                color: ColorSchemes.white,
                borderRadius: BorderRadiusDirectional.all(
                  Radius.circular(16.0),
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
              child: DelegationDetailsWidget(
                onPressedCall: onPressedCall,
                onDelegationButtonPressed: onDelegationButtonPressed,
                delegationScanned: delegationScanned,
                isValid: isValid,
                userUnitInfo: userUnitInfo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
