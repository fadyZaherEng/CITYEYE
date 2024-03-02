// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/domain/entities/dashboard/chart.dart';
import 'package:city_eye/src/presentation/widgets/custom_filter_button_with_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class UserStatesQRScanWidget extends StatefulWidget {
  final List<ChartModel> chartData;
  void Function() onTapFilter;
  final int allQrNumber;
  final bool isClickedFilterButton;
  final bool isOpacityFilterButton;

  UserStatesQRScanWidget({
    super.key,
    required this.chartData,
    required this.onTapFilter,
    required this.allQrNumber,
    required this.isClickedFilterButton,
    required this.isOpacityFilterButton,
  });

  @override
  State<UserStatesQRScanWidget> createState() => _UserStatesQRScanWidgetState();
}

class _UserStatesQRScanWidgetState extends State<UserStatesQRScanWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: FittedBox(
                        child: SizedBox(
                          height: 22,
                          child: Text(
                            "${S.current.qRsScan}   ",
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
                      onTapFilter: widget.onTapFilter,
                      isClicked: widget.isClickedFilterButton,
                      isOpacity: widget.isOpacityFilterButton,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  RotatedBox(
                    quarterTurns: 3,
                    child: Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        S.current.states,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: _checkIfQrScansEmpty()
                                  ? ColorSchemes.dashboardUserStates
                                  : ColorSchemes.dashboardGraphTitleColor,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 165,
                    width: 271,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: SizedBox(
                            height: 159,
                            child: SfCartesianChart(
                              plotAreaBorderWidth: 0,
                              margin: const EdgeInsets.only(
                                left: 20,
                              ),
                              primaryXAxis: CategoryAxis(
                                isVisible: true,
                                minorTickLines: const MinorTickLines(
                                  width: 0,
                                  size: 15,
                                  color: ColorSchemes.dashboardGray,
                                ),
                                majorTickLines: const MajorTickLines(
                                  width: 0,
                                  size: 15,
                                  color: ColorSchemes.dashboardGray,
                                ),
                                majorGridLines: const MajorGridLines(
                                  width: 0,
                                ),
                                labelPlacement: LabelPlacement.betweenTicks,
                                minorGridLines: const MinorGridLines(
                                  width: 0,
                                ),
                                placeLabelsNearAxisLine: true,
                                crossesAt: 0.5,
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: ColorSchemes.dashBoardTitleColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                autoScrollingMode: AutoScrollingMode.start,
                                labelAlignment: LabelAlignment.end,
                                labelPosition: ChartDataLabelPosition.outside,
                              ),
                              primaryYAxis: CategoryAxis(
                                isVisible: true,
                                rangePadding: widget.allQrNumber == 0
                                    ? ChartRangePadding.none
                                    : ChartRangePadding.normal,
                                labelPlacement: widget.allQrNumber == 0
                                    ? LabelPlacement.onTicks
                                    : LabelPlacement.betweenTicks,
                                tickPosition: TickPosition.outside,
                                title: AxisTitle(
                                  text:
                                      "${S.current.all} ( ${widget.allQrNumber} )",
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: _checkIfQrScansEmpty()
                                            ? ColorSchemes.dashboardUserStates
                                            : null,
                                      ),
                                  alignment: ChartAlignment.far,
                                ),
                              ),
                              series: <ChartSeries<ChartModel, String>>[
                                BarSeries<ChartModel, String>(
                                  dataSource: widget.chartData,
                                  xValueMapper: (ChartModel data, _) =>
                                      data.xAxisValue,
                                  yValueMapper: (ChartModel data, _) =>
                                      _checkIfQrScansEmpty()
                                          ? null
                                          : data.yAxisValue,
                                  isTrackVisible: false,
                                  enableTooltip: false,
                                  isVisible: true,
                                  width: 1.4,
                                  spacing: 0.4,
                                  pointColorMapper: (ChartModel data, _) =>
                                      data.labelColor,
                                  dataLabelSettings: DataLabelSettings(
                                    isVisible: true,
                                    showZeroValue: true,
                                    margin: const EdgeInsets.all(0),
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color:
                                              ColorSchemes.dashBoardTitleColor,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: widget.allQrNumber == 0 ? 105 : 92,
                              bottom: 15,
                            ),
                            child: Text(
                              "0",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color: _checkIfQrScansEmpty()
                                        ? ColorSchemes.dashboardUserStates
                                        : ColorSchemes
                                            .dashBoardBottomSheetListItemBorderColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                S.current.numberOfScans,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: _checkIfQrScansEmpty()
                          ? ColorSchemes.dashboardUserStates
                          : ColorSchemes.dashboardGraphTitleColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _checkIfQrScansEmpty() => widget.allQrNumber == 0 ? true : false;
}
