// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_support_number.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/maintainance/widgets/maintainance_empty_widget.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/maintainance/widgets/maintainance_request_graph_widget.dart';
import 'package:city_eye/src/presentation/widgets/custom_filter_button_with_animation_widget.dart';
import 'package:flutter/material.dart';

class MaintainanceRequestCardWidget extends StatefulWidget {
  final GetSupportNumber getSupportNumber;
  void Function() onTap;
  final bool isClickedFilterButton;
  final bool isOpacityFilterButton;
  final bool isResponseReturnSuccess;

  MaintainanceRequestCardWidget({
    super.key,
    required this.onTap,
    required this.getSupportNumber,
    required this.isClickedFilterButton,
    required this.isOpacityFilterButton,
    required this.isResponseReturnSuccess,
  });

  @override
  State<MaintainanceRequestCardWidget> createState() =>
      _MaintainanceRequestCardWidgetState();
}

class _MaintainanceRequestCardWidgetState
    extends State<MaintainanceRequestCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 512,
      decoration: const BoxDecoration(
        color: ColorSchemes.dashboardCardColor,
        borderRadius: BorderRadiusDirectional.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: ColorSchemes.white,
            blurRadius: 10,
            spreadRadius: 15,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: FittedBox(
                        child: SizedBox(
                          height: 22,
                          child: Text(
                            "${S.current.maintenanceRequests}   ",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: ColorSchemes.dashBoardTitleColor,
                                ),
                          ),
                        ),
                      ),
                    ),
                    CustomFilterButtonWidget(
                      onTapFilter: widget.onTap,
                      isClicked: widget.isClickedFilterButton,
                      isOpacity: widget.isOpacityFilterButton,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 54,
              padding: const EdgeInsetsDirectional.all(10),
              decoration: BoxDecoration(
                color: ColorSchemes.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  "${widget.getSupportNumber.numberOfAllSupportRequests} ${S.of(context).requests}",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: ColorSchemes.primary,
                      ),
                ),
              ),
            ),
            _checkIfMaintainanceRequestEmpty() && widget.isResponseReturnSuccess
                ? const MaintainanceEmptyWidget()
                : MaintainanceRequestGraphWidget(
                    getSupportNumber: widget.getSupportNumber,
                  ),
          ],
        ),
      ),
    );
  }

  bool _checkIfMaintainanceRequestEmpty() =>
      widget.getSupportNumber.numberOfAllSupportRequests == 0 ? true : false;
}
