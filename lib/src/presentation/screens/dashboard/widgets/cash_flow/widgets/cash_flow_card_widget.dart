import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/domain/entities/dashboard/chart.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/cash_flow/widgets/cash_flow_graph_widget.dart';
import 'package:flutter/material.dart';

class CashFlowCardWidget extends StatefulWidget {
  final List<ChartModel> chartData;

  const CashFlowCardWidget({
    super.key,
    required this.chartData,
  });

  @override
  State<CashFlowCardWidget> createState() => _CashFlowCardWidgetState();
}

class _CashFlowCardWidgetState extends State<CashFlowCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Container(
        height: 546,
        padding: const EdgeInsetsDirectional.only(
          top: 15,
          bottom: 15,
          start: 12,
          end: 12,
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.current.cashFlow,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: ColorSchemes.dashBoardTitleColor,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 54,
                width: double.infinity,
                padding: const EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                  color: ColorSchemes.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(S.current.paymentForTheLastDays,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CashFlowGraphWidget(
              chartData: widget.chartData,
            ),
          ],
        ),
      ),
    );
  }
}
