// ignore_for_file: avoid_print

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/convert_date_to_time_zone_english.dart';
import 'package:city_eye/src/core/utils/formate_day_to_day_month_year.dart';
import 'package:city_eye/src/core/utils/show_bottom_sheet.dart';
import 'package:city_eye/src/core/utils/show_massage_dialog_widget.dart';
import 'package:city_eye/src/domain/entities/dashboard/chart.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_compound_status.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_qr_number.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_qr_status.dart';
import 'package:city_eye/src/domain/entities/lock_up_data/get_lock_up_data_rows.dart';
import 'package:city_eye/src/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/user_states/widgets/bottom_sheet_content_widget.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/user_states/widgets/user_states_card_widget.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/user_states/widgets/user_states_empty_widget.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/user_states/widgets/user_states_graph_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class UserStatesWidget extends BaseStatefulWidget {
  final List<LookupFiles> lookupFilesQr;
  GetCompoundAllUserStatus getCompoundAllUserStatus;
  final List<LookupFiles> lookupFilesGuest;
  final List<GetQrStatus> getQrStatus;

  UserStatesWidget({
    super.key,
    required this.lookupFilesQr,
    required this.lookupFilesGuest,
    required this.getCompoundAllUserStatus,
    required this.getQrStatus,
  });

  @override
  BaseState<UserStatesWidget> baseCreateState() => _UserStatesWidgetState();
}

class _UserStatesWidgetState extends BaseState<UserStatesWidget> {
  final List<String> _userStatesCardItems = [
    ImagePaths.icActiveUsers,
    ImagePaths.icPendingUsers,
    ImagePaths.icDisabledUsers,
  ];
  final List<String> _usersStatusNames = [
    S.current.activeUsers,
    S.current.pendingUsers,
    S.current.disabledUsers,
  ];

  final List<Color> _usersStatusColors = [
    ColorSchemes.activeUserColor,
    ColorSchemes.pendingUserColor,
    ColorSchemes.disabledUserColor
  ];
  final List<ChartModel> _chartData = [
    ChartModel(
      xAxisValue: S.current.pending,
      yAxisValue: 0,
      labelColor: ColorSchemes.dashboardGray,
    ),
    ChartModel(
      xAxisValue: S.current.scanned,
      yAxisValue: 0,
      labelColor: ColorSchemes.amber,
    ),
    ChartModel(
      xAxisValue: S.current.completed,
      yAxisValue: 0,
      labelColor: ColorSchemes.green,
    ),
    ChartModel(
      xAxisValue: S.current.hold,
      yAxisValue: 0,
      labelColor: ColorSchemes.red,
    ),
  ];
  bool _isBottomSheetButtonClicked = false;
  int _bottomSheetQrTypeSelectedIndex = 0;
  int _bottomSheetGustTypeSelectedIndex = 0;
  int _bottomSheetGetQrStatusIndex = 0;
  String _bottomSheetFromDate =
      DateFormat('d/M/y').format(DateTime.now()).toString();
  String _bottomSheetToDate =
      DateFormat('d/M/y').format(DateTime.now()).toString();
  DateTime _bottomSheetSelectedFromDate = DateTime.now();
  DateTime _bottomSheetSelectedToDate = DateTime.now();
  GetQrNumber _getQrNumber = const GetQrNumber();
  bool _isClickedFilterButton = false;
  bool _isOpacityFilterButton = false;

  DashboardBloc get _bloc => BlocProvider.of<DashboardBloc>(context);

  @override
  void initState() {
    super.initState();
    _bloc.add(DashboardGetQrNumbersEvent(
      bottomSheetFromDate: convertDateToTimeZoneEnglish(
          _bottomSheetSelectedFromDate.toString().trim()),
      bottomSheetToDate: convertDateToTimeZoneEnglish(
          _bottomSheetSelectedToDate.toString().trim()),
      guestTypeId: -1,
      qrTypeId: -1,
      qrStatusId: -1,
      guestTypeIndex: -1,
      qrTypeIndex: -1,
      getQrStatusIndex: -1,
      isComeFromBottomSheet: false,
    ));
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
        listener: (context, state) {
      if (state is DashboardGetLookupRowsError) {
        _showDialog(context: context, errorMessage: state.errorMessage);
      } else if (state is DashboardGetQrNumberSuccess) {
        _isClickedFilterButton = state.isButtonClicked;
        _isOpacityFilterButton = state.isButtonOpacity;
        if (state.isComeFromBottomSheet) {
          _bottomSheetFromDate =
              formaterDateToDayMonthYear(state.bottomSheetFromDate);
          _bottomSheetToDate =
              formaterDateToDayMonthYear(state.bottomSheetToDate);
          _bottomSheetQrTypeSelectedIndex = state.qrTypeIndex;
          _bottomSheetGustTypeSelectedIndex = state.guestTypeIndex;
          _bottomSheetGetQrStatusIndex = state.getQrStatusIndex;
          _isBottomSheetButtonClicked = true;
        }
        hideLoading();
        _getQrNumber = state.getQrNumber;
        _chartData[0].yAxisValue =
            double.parse(state.getQrNumber.pendingQrNumber.toString());
        _chartData[1].yAxisValue =
            double.parse(state.getQrNumber.scannedQrNumber.toString());
        _chartData[2].yAxisValue =
            double.parse(state.getQrNumber.completedQrNumber.toString());
        _chartData[3].yAxisValue =
            double.parse(state.getQrNumber.holdQrNumber.toString());
      } else if (state is DashboardGetQrNumberLoading) {
        showLoading();
      } else if (state is DashboardGetQrNumberError) {
        _showDialog(context: context, errorMessage: state.errorMessage);
        hideLoading();
      } else if (state is DashboardGetCompoundAllUserStatusSuccess) {
        widget.getCompoundAllUserStatus = state.getCompoundAllUserStatus;
      } else if (state is DashboardGetLookupRowsError) {
        hideLoading();
        _showDialog(context: context, errorMessage: state.errorMessage);
      } else if (state is DashboardGetLookupRowsLoading) {
        showLoading();
      } else if (state is DashboardGetLookupRowsSuccess) {
        hideLoading();
      } else if (state is DashBoardBottomSheetCloseState) {
        _isClickedFilterButton = state.isButtonClicked;
        _isOpacityFilterButton = state.isButtonOpacity;
        _bloc.add(DashboardPopBackEvent());
      } else if (state is DashboardIsOpacityFilterButtonFromUserStates) {
        _isOpacityFilterButton = state.isCanOpacity;
      } else if (state is DashboardPopBackState) {
        Navigator.of(context).pop();
      }
    }, builder: (context, state) {
      return SingleChildScrollView(
        child: Column(
          children: [
            _checkIfUserStatesIsEmpty()
                ? UserStatesEmptyWidget(
                    userStatesCardItems: _userStatesCardItems,
                    names: _usersStatusNames,
                  )
                : UserStatesCardWidget(
                    userStatesCardItems: _userStatesCardItems,
                    userStatesCardColors: _usersStatusColors,
                    getCompoundAllUserStatus: widget.getCompoundAllUserStatus,
                    names: _usersStatusNames,
                  ),
            const SizedBox(
              height: 25,
            ),
            UserStatesQRScanWidget(
              chartData: _chartData.reversed.toList(),
              onTapFilter: () {
                if (!_isClickedFilterButton) {
                  _isClickedFilterButton = true;
                  _bloc.add(DashboardIsOpacityFilterButtonFromUserStatesEvent(
                    isCanOpacity: _isOpacityFilterButton,
                  ));
                  Future.delayed(const Duration(
                    milliseconds: 1000,
                  )).then((value) {
                    _bloc.add(DashboardIsOpacityFilterButtonFromUserStatesEvent(
                      isCanOpacity: _isOpacityFilterButton,
                    ));
                    _showBottomSheet(context);
                  });
                }
              },
              allQrNumber: _getQrNumber.allQrNumber,
              isClickedFilterButton: _isClickedFilterButton,
              isOpacityFilterButton: _isOpacityFilterButton,
            ),
          ],
        ),
      );
    });
  }

  bool _checkIfUserStatesIsEmpty() {
    if (widget.getCompoundAllUserStatus.pending == 0 &&
        widget.getCompoundAllUserStatus.active == 0 &&
        widget.getCompoundAllUserStatus.notActive == 0) {
      return true;
    }
    return false;
  }

  void _showBottomSheet(BuildContext context) {
    showBottomSheetWidget(
      context: context,
      isDismissible: false,
      onClose: () {
        _bloc.add(DashBoardBottomSheetCloseEvent());
      },
      content: BottomSheetContentWidget(
        lookupFilesGuest: widget.lookupFilesGuest,
        lookupFilesQr: widget.lookupFilesQr,
        gustTypeSelectedIndex: _bottomSheetGustTypeSelectedIndex,
        qrTypeSelectedIndex: _bottomSheetQrTypeSelectedIndex,
        fromDate: _bottomSheetFromDate,
        toDate: _bottomSheetToDate,
        selectedFromDate: _bottomSheetSelectedFromDate,
        selectedToDate: _bottomSheetSelectedToDate,
        isButtonClicked: _isBottomSheetButtonClicked,
        getQrStatus: widget.getQrStatus,
        getQrStatusIndex: _bottomSheetGetQrStatusIndex,
        onConfirmPressed: ({
          required String toDate,
          required String toDateSelected,
          required String fromDate,
          required String fromDateSelected,
          required int qrTypeIndex,
          required int guestTypeIndex,
          required int getQrStatusIndex,
        }) {
          _bloc.add(DashboardPopBackEvent());
          _bottomSheetFromDate = fromDate;
          _bottomSheetToDate = toDate;
          _bottomSheetSelectedFromDate = DateTime.parse(fromDateSelected);
          _bottomSheetSelectedToDate = DateTime.parse(toDateSelected);
          _bloc.add(DashboardGetQrNumbersEvent(
            bottomSheetFromDate: convertDateToTimeZoneEnglish(fromDateSelected),
            bottomSheetToDate: convertDateToTimeZoneEnglish(toDateSelected),
            guestTypeId: widget.lookupFilesGuest[guestTypeIndex].id,
            qrTypeId: widget.lookupFilesQr[qrTypeIndex].id,
            qrStatusId: widget.getQrStatus[getQrStatusIndex].id,
            guestTypeIndex: guestTypeIndex,
            qrTypeIndex: qrTypeIndex,
            getQrStatusIndex: getQrStatusIndex,
            isComeFromBottomSheet: true,
          ));
        },
      ),
      height: 480,
    );
  }

  void _showDialog({
    required BuildContext context,
    required String errorMessage,
  }) =>
      showMessageDialogWidget(
        context: context,
        text: errorMessage,
        icon: ImagePaths.icCancelNew,
        buttonText: S.current.ok,
        onTap: () {
          _bloc.add(DashboardPopBackEvent());
        },
      );
}
