import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/show_message_dialog_widget.dart';
import 'package:city_eye/src/domain/entities/dashboard/chart.dart';
import 'package:city_eye/src/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/services/widgets/service_subscription_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesWidget extends BaseStatefulWidget {
  const ServicesWidget({super.key});

  @override
  BaseState<ServicesWidget> baseCreateState() => _ServicesWidgetState();
}

class _ServicesWidgetState extends BaseState<ServicesWidget> {
  final List<Color> _chartColor = [
    ColorSchemes.primary,
    ColorSchemes.dashboardGreen,
    ColorSchemes.yellow,
    ColorSchemes.dashboardGray,
    ColorSchemes.black,
  ];

  List<ChartModel> _chartData = [];

  List<GetTopFiveUsers> _topFiveUsers = [];

  DashboardBloc get _bloc => BlocProvider.of<DashboardBloc>(context);
  bool isResponseReturnSuccess = false;

  @override
  void initState() {
    super.initState();
    _bloc.add(DashboardGetTopFiveRequestNumbersEvent());
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is DashboardGetTopFiveUsersSuccess) {
          isResponseReturnSuccess = true;
          _topFiveUsers = state.getTopFiveUsers;
          _chartData.clear();
          _chartData = _topFiveUsers
              .map((e) => ChartModel(
                    labelColor: _chartColor[_topFiveUsers.indexOf(e)],
                    xAxisValue: e.name,
                    yAxisValue: e.percentage,
                  ))
              .toList();
          hideLoading();
        } else if (state is DashboardGetTopFiveUsersError) {
          hideLoading();
          _showDialog(context: context, errorMessage: state.errorMessage);
        } else if (state is DashboardGetTopFiveUsersLoading) {
          showLoading();
        } else if (state is DashboardPopBackState) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: ServiceSubscriptionWidget(
            chartData: _chartData,
            isResponseReturnSuccess: isResponseReturnSuccess,
            onTapSeeAllServices: () {},
          ),
        );
      },
    );
  }

  void _showDialog({
    required BuildContext context,
    required String errorMessage,
  }) {
    showMessageDialogWidget(
      context: context,
      text: errorMessage,
      icon: ImagePaths.cancel,
      buttonText: S.current.ok,
      onTap: () {
        _bloc.add(DashboardPopBackEvent());
      },
    );
  }
}
