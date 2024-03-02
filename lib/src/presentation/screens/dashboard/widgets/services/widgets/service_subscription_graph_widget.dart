import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/domain/entities/dashboard/chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ServiceSubscriptionGraphWidget extends StatefulWidget {
  final List<ChartModel> chartData;

  const ServiceSubscriptionGraphWidget({
    super.key,
    required this.chartData,
  });

  @override
  State<ServiceSubscriptionGraphWidget> createState() =>
      _ServiceSubscriptionGraphWidgetState();
}

class _ServiceSubscriptionGraphWidgetState
    extends State<ServiceSubscriptionGraphWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 318,
      child: Center(
        child: SfCircularChart(
          series: <CircularSeries<ChartModel, String>>[
            DoughnutSeries<ChartModel, String>(
              dataSource: widget.chartData,
              xValueMapper: (ChartModel data, _) => data.xAxisValue,
              yValueMapper: (ChartModel data, _) => data.yAxisValue,
              dataLabelMapper: (ChartModel data, _) => data.xAxisValue
                  .split(" ")
                  .asMap()
                  .entries
                  .map((e) => e.key == 0 ? "${e.value}\n" : " ${e.value}")
                  .join(),
              pointColorMapper: (ChartModel data, _) => data.labelColor,
              groupMode: CircularChartGroupMode.point,
              radius: '57%',
              enableTooltip: true,
              groupTo: widget.chartData.length.toDouble(),
              //  explodeAll: true,
              explode: true,
              //explodeIndex: 1,
              innerRadius: "67%",
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                textStyle: ThemeData().textTheme.bodyMedium?.copyWith(
                      color: ColorSchemes.dashBoardTitleColor,
                    ),
                showZeroValue: true,
                showCumulativeValues: false,
                labelIntersectAction: LabelIntersectAction.shift,
                labelPosition: ChartDataLabelPosition.outside,
                useSeriesColor: false,
                connectorLineSettings: const ConnectorLineSettings(
                  type: ConnectorType.line,
                  width: 1,
                  length: '25%',
                  color: ColorSchemes.dashboardGray,
                ),
              ),
            ),
          ],
          annotations: <CircularChartAnnotation>[
            CircularChartAnnotation(
              widget: Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    S.current.topFiveSubscribedServices,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ColorSchemes.dashBoardTitleColor,
                        ),
                  ),
                ),
              ),
            )
          ],
          enableMultiSelection: true,
          tooltipBehavior: TooltipBehavior(
            shouldAlwaysShow: true,
            tooltipPosition: TooltipPosition.auto,
            activationMode: ActivationMode.singleTap,
            canShowMarker: true,
            shared: true,
          ),
          selectionGesture: ActivationMode.singleTap,
        ),
      ),
    );
  }
}
