// ignore_for_file: deprecated_member_use

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/domain/entities/home/security/delegation_scanned.dart';
import 'package:city_eye/src/domain/entities/home/security/user_unit_info.dart';
import 'package:city_eye/src/presentation/screens/delegation_details/widgets/delegation_details_button_widget.dart';
import 'package:city_eye/src/presentation/screens/delegation_details/widgets/delegation_details_item_widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DelegationDetailsWidget extends StatelessWidget {
  final void Function() onPressedCall;
  final void Function() onDelegationButtonPressed;
  final DelegationScanned delegationScanned;
  final UserUnitInfo userUnitInfo;
  final bool isValid;

  const DelegationDetailsWidget({
    super.key,
    required this.onPressedCall,
    required this.onDelegationButtonPressed,
    required this.delegationScanned,
    required this.isValid,
    required this.userUnitInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
      child: Column(
        children: [
          Container(
            width: 230,
            padding: const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              color: ColorSchemes.delegationCardColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 32,
                  width: 96,
                  padding: const EdgeInsets.all(4),
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: ColorSchemes.delegationStatusBackgroundColor,
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(
                      color: isValid ? ColorSchemes.green : ColorSchemes.red,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      isValid ? S.of(context).valid : S.of(context).expired,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color:
                                isValid ? ColorSchemes.green : ColorSchemes.red,
                          ),
                    ),
                  ),
                ),
                SvgPicture.asset(
                  ImagePaths.arrowRight,
                  matchTextDirection: true,
                  color: isValid ? ColorSchemes.green : ColorSchemes.red,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  delegationScanned.toDate
                      .split("T")[0]
                      .split("-")
                      .reversed
                      .join("-")
                      .toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isValid ? ColorSchemes.green : ColorSchemes.red,
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          DelegationDetailsItemWidget(
            title: userUnitInfo.userType.name,
            path: ImagePaths.icOwner,
            value: delegationScanned.name,
          ),
          const SizedBox(
            height: 12,
          ),
          const DottedLine(
            dashColor: ColorSchemes.dividerColor,
            dashGapColor: ColorSchemes.white,
            dashLength: 2,
            dashGapLength: 2,
            lineLength: double.infinity,
            lineThickness: 3,
          ),
          const SizedBox(
            height: 12,
          ),
          DelegationDetailsItemWidget(
            onPressed: onPressedCall,
            title: S.of(context).phone,
            path: ImagePaths.icCall,
            value: "\u200E${delegationScanned.authMobile}",
          ),
          const SizedBox(
            height: 12,
          ),
          const DottedLine(
            dashColor: ColorSchemes.dividerColor,
            dashGapColor: ColorSchemes.white,
            dashLength: 2,
            dashGapLength: 2,
            lineLength: double.infinity,
            lineThickness: 3,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(ImagePaths.icLocation),
              const SizedBox(
                width: 2,
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).ownerAddress,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ColorSchemes.gray,
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "${userUnitInfo.compoundName} - ${userUnitInfo.unitName}",
                      maxLines: 5,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ColorSchemes.black,
                            fontFamily: "Montserrat",
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ]),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const DottedLine(
            dashColor: ColorSchemes.dividerColor,
            dashGapColor: ColorSchemes.white,
            dashLength: 2,
            dashGapLength: 2,
            lineLength: double.infinity,
            lineThickness: 3,
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(ImagePaths.icOwner),
                  const SizedBox(
                    width: 2,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    S.of(context).delegatorName,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: ColorSchemes.gray,
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                delegationScanned.authName,
                maxLines: 5,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ColorSchemes.black,
                      fontFamily: "Montserrat",
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const DottedLine(
            dashColor: ColorSchemes.dividerColor,
            dashGapColor: ColorSchemes.white,
            dashLength: 2,
            dashGapLength: 2,
            lineLength: double.infinity,
            lineThickness: 3,
          ),
          const SizedBox(
            height: 12,
          ),
          DelegationDetailsItemWidget(
            onPressed: onPressedCall,
            title: S.of(context).delegationPhone,
            path: ImagePaths.icCall,
            value: "\u200E${delegationScanned.authMobile}",
          ),
          const SizedBox(
            height: 12,
          ),
          const DottedLine(
            dashColor: ColorSchemes.dividerColor,
            dashGapColor: ColorSchemes.white,
            dashLength: 2,
            dashGapLength: 2,
            lineLength: double.infinity,
            lineThickness: 3,
          ),
          const SizedBox(
            height: 12,
          ),
          DelegationDetailsItemWidget(
            title: S.of(context).delegatorID,
            path: ImagePaths.icADD,
            value: delegationScanned.id.toString(),
          ),
          const SizedBox(
            height: 12,
          ),
          DelegationDetailsButtonWidget(
            onPressed: onDelegationButtonPressed,
            delegationName: delegationScanned.authName,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
