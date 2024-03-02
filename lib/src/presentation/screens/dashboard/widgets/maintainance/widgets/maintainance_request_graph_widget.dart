import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/domain/entities/dashboard/chart.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_support_number.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MaintainanceRequestGraphWidget extends StatefulWidget {
  final GetSupportNumber getSupportNumber;

  const MaintainanceRequestGraphWidget({
    super.key,
    required this.getSupportNumber,
  });

  @override
  State<MaintainanceRequestGraphWidget> createState() =>
      _MaintainanceRequestGraphWidgetState();
}

class _MaintainanceRequestGraphWidgetState
    extends State<MaintainanceRequestGraphWidget> {
  List<ChartModel> _chartData = [];

  @override
  void initState() {
    _initializeChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 324,
        child: SfCircularChart(
          //  annotations: _getAnnotation(),
          margin: const EdgeInsets.all(0),
          series: <CircularSeries>[
            PieSeries<ChartModel, double>(
              dataSource: _chartData,
              xValueMapper: (ChartModel data, _) => data.yAxisValue,
              yValueMapper: (ChartModel data, _) => data.yAxisValue,
              dataLabelMapper: (ChartModel data, _) => data.xAxisValue
                  .split(" ")
                  .asMap()
                  .entries
                  .map((e) => e.key == 0 ? "${e.value}\n" : " ${e.value}")
                  .join(),
              pointColorMapper: (ChartModel data, _) => data.labelColor,
              strokeColor: ColorSchemes.white,
              strokeWidth: 2,
              explodeAll: false,
              explode: false,
              radius: '50%',
              enableTooltip: true,
              dataLabelSettings: DataLabelSettings(
                isVisible: true,
                textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
        ),
      ),
    );
  }

  void _initializeChartData() {
    _chartData = [
      ChartModel(
          xAxisValue:
              '${widget.getSupportNumber.numberOfPendingRequests} ${S.current.pending}',
          yAxisValue:
              widget.getSupportNumber.numberOfPendingRequests.toDouble(),
          label:
              '${(widget.getSupportNumber.numberOfPendingRequests / widget.getSupportNumber.numberOfAllSupportRequests) * 100}%',
          labelColor: ColorSchemes.dashboardGray),
      ChartModel(
          xAxisValue:
              '${widget.getSupportNumber.numberOfProgressRequests} ${S.current.inProgress}',
          yAxisValue:
              widget.getSupportNumber.numberOfProgressRequests.toDouble(),
          label:
              '${(widget.getSupportNumber.numberOfProgressRequests / widget.getSupportNumber.numberOfAllSupportRequests) * 100}%',
          labelColor: ColorSchemes.yellow),
      ChartModel(
          xAxisValue:
              '${widget.getSupportNumber.numberOfCompletedRequests} ${S.current.completed}',
          yAxisValue:
              widget.getSupportNumber.numberOfCompletedRequests.toDouble(),
          label:
              '${(widget.getSupportNumber.numberOfCompletedRequests / widget.getSupportNumber.numberOfAllSupportRequests) * 100}%',
          labelColor: ColorSchemes.dashboardGreen),
      ChartModel(
          xAxisValue:
              '${widget.getSupportNumber.numberOfCancelledRequests} ${S.current.canceled}',
          yAxisValue:
              widget.getSupportNumber.numberOfCancelledRequests.toDouble(),
          label:
              '${(widget.getSupportNumber.numberOfCancelledRequests / widget.getSupportNumber.numberOfAllSupportRequests) * 100}%',
          labelColor: ColorSchemes.black),
      ChartModel(
          xAxisValue:
              '${widget.getSupportNumber.numberOfHoldRequests} ${S.current.hold}',
          yAxisValue: widget.getSupportNumber.numberOfHoldRequests.toDouble(),
          label:
              '${(widget.getSupportNumber.numberOfHoldRequests / widget.getSupportNumber.numberOfAllSupportRequests) * 100}%',
          labelColor: ColorSchemes.red),
      ChartModel(
          xAxisValue:
              '${widget.getSupportNumber.numberOfNeedPaymentRequests} ${S.current.needPayment}',
          yAxisValue:
              widget.getSupportNumber.numberOfNeedPaymentRequests.toDouble(),
          label:
              '${(widget.getSupportNumber.numberOfNeedPaymentRequests / widget.getSupportNumber.numberOfAllSupportRequests) * 100}%',
          labelColor: ColorSchemes.primary),
    ];
  }

// _getAnnotation() {
//   return <CircularChartAnnotation>[
//     CircularChartAnnotation(
//       widget: Text(
//         _chartData[1].text,
//         textAlign: TextAlign.start,
//         style: const TextStyle(color: ColorSchemes.white),
//       ),
//       radius: '10%',
//       verticalAlignment: ChartAlignment.near,
//       horizontalAlignment: ChartAlignment.near,
//     ),
//     CircularChartAnnotation(
//       widget: Container(
//         padding: const EdgeInsetsDirectional.only(end: 5),
//         child: Text(
//           _chartData[2].text,
//           textAlign: TextAlign.end,
//           style: const TextStyle(color: ColorSchemes.white),
//         ),
//       ),
//       // radius: '40%',
//       verticalAlignment: ChartAlignment.near,
//       horizontalAlignment: ChartAlignment.far,
//     ),
//     CircularChartAnnotation(
//       widget: Container(
//         padding: const EdgeInsets.only(bottom: 10),
//         child: Text(
//           _chartData[0].text,
//           textAlign: TextAlign.start,
//           style: const TextStyle(color: ColorSchemes.white),
//         ),
//       ),
//       radius: '20%',
//       verticalAlignment: ChartAlignment.far,
//       horizontalAlignment: ChartAlignment.far,
//     ),
//     CircularChartAnnotation(
//       widget: Container(
//         padding: const EdgeInsetsDirectional.only(start: 15, bottom: 35),
//         child: Text(
//           _chartData[5].text,
//           textAlign: TextAlign.start,
//           style: const TextStyle(color: ColorSchemes.white),
//         ),
//       ),
//       radius: '10%',
//       verticalAlignment: ChartAlignment.far,
//       horizontalAlignment: ChartAlignment.far,
//     ),
//     CircularChartAnnotation(
//       widget: Container(
//         padding: const EdgeInsetsDirectional.only(start: 0, bottom: 25),
//         child: Text(
//           _chartData[4].text,
//           textAlign: TextAlign.start,
//           style: const TextStyle(color: ColorSchemes.white),
//         ),
//       ),
//       radius: '3%',
//       verticalAlignment: ChartAlignment.far,
//       horizontalAlignment: ChartAlignment.far,
//     ),
//     CircularChartAnnotation(
//       widget: Container(
//         padding: const EdgeInsetsDirectional.only(bottom: 15, end: 15),
//         child: Text(
//           _chartData[3].text,
//           textAlign: TextAlign.start,
//           style: const TextStyle(color: ColorSchemes.white),
//         ),
//       ),
//       radius: '5%',
//       verticalAlignment: ChartAlignment.far,
//       horizontalAlignment: ChartAlignment.far,
//     )
//   ];
// }
}
