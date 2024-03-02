// ignore_for_file: deprecated_member_use

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/domain/entities/dashboard/chart.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/services/widgets/service_subscription_empty_widget.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/services/widgets/service_subscription_graph_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceSubscriptionWidget extends StatefulWidget {
  final List<ChartModel> chartData;
  final void Function() onTapSeeAllServices;
  final bool isResponseReturnSuccess;

  const ServiceSubscriptionWidget({
    super.key,
    required this.chartData,
    required this.onTapSeeAllServices,
    required this.isResponseReturnSuccess,
  });

  @override
  State<ServiceSubscriptionWidget> createState() =>
      _ServiceSubscriptionWidgetState();
}

class _ServiceSubscriptionWidgetState extends State<ServiceSubscriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 546,
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 12,
        vertical: 15,
      ),
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
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              S.current.servicesSubscriptions,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: ColorSchemes.dashBoardTitleColor,
                  ),
            ),
          ),
          _checkIfServicesSubscriptionEmpty() && widget.isResponseReturnSuccess
              ? const ServiceSubscriptionEmptyWidget()
              : ServiceSubscriptionGraphWidget(
                  chartData: widget.chartData,
                ),
          SizedBox(
            height: 110,
            child: Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: InkWell(
                onTap: widget.onTapSeeAllServices,
                child: Container(
                  height: 54,
                  width: 206,
                  padding: const EdgeInsetsDirectional.all(12),
                  decoration: BoxDecoration(
                    color: ColorSchemes.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: _checkIfServicesSubscriptionEmpty()
                          ? ColorSchemes.gray
                          : ColorSchemes.primary,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        S.current.seeAllServices,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: _checkIfServicesSubscriptionEmpty()
                                  ? ColorSchemes.gray
                                  : ColorSchemes.primary,
                            ),
                      ),
                      const SizedBox(width: 10),
                      SvgPicture.asset(
                        ImagePaths.icArrowRight,
                        color: _checkIfServicesSubscriptionEmpty()
                            ? ColorSchemes.gray
                            : ColorSchemes.primary,
                        matchTextDirection: true,
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _checkIfServicesSubscriptionEmpty() {
    bool isEmpty = true;
    for (var element in widget.chartData) {
      if (element.yAxisValue != 0) {
        isEmpty = false;
      }
    }
    return isEmpty;
  }
}
