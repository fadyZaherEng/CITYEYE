import 'package:city_eye/src/core/utils/formate_date_to_days.dart';
import 'package:city_eye/src/domain/entities/dashboard/chart.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_compound_last_five_day_cash_flow.dart';
import 'package:city_eye/src/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/cash_flow/widgets/cash_flow_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CashFlowWidget extends StatefulWidget {
  final List<GetCompoundLast5DayCashFlow> getCompoundLast5DayCashFlow;

  const CashFlowWidget({
    super.key,
    required this.getCompoundLast5DayCashFlow,
  });

  @override
  State<CashFlowWidget> createState() => _CashFlowWidgetState();
}

class _CashFlowWidgetState extends State<CashFlowWidget> {
  final List<ChartModel> _chartData = [
    // ChartModel(xAxisValue: 'Wed \n 15', yAxisValue: 300),
    // ChartModel(xAxisValue: 'Thu \n 16', yAxisValue: 100),
    // ChartModel(xAxisValue: 'Fri \n 17', yAxisValue: 150),
    // ChartModel(xAxisValue: 'Sat \n 18', yAxisValue: 800),
    // ChartModel(xAxisValue: 'Sun \n 19', yAxisValue: 500)
  ];

  @override
  void initState() {
    super.initState();
    _chartData.addAll(
      widget.getCompoundLast5DayCashFlow.map(
        (e) => ChartModel(
          xAxisValue: formateDateToDays(e.date),
          yAxisValue: double.parse(
            e.paidAmounts.toString(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: CashFlowCardWidget(
            chartData: _chartData,
          ),
        );
      },
    );
  }
}
