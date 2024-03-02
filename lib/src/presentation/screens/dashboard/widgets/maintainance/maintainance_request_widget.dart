import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/convert_date_to_time_zone_english.dart';
import 'package:city_eye/src/core/utils/formate_day_to_day_month_year.dart';
import 'package:city_eye/src/core/utils/show_bottom_sheet.dart';
import 'package:city_eye/src/core/utils/show_massage_dialog_widget.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_support_number.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_tech_support_status.dart';
import 'package:city_eye/src/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/maintainance/widgets/bottom_sheet_content_widget.dart';
import 'package:city_eye/src/presentation/screens/dashboard/widgets/maintainance/widgets/maintainance_request_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MaintainanceRequestWidget extends BaseStatefulWidget {
  final List<GetTechSupportStatus> getTechSupportStatus;

  const MaintainanceRequestWidget({
    super.key,
    required this.getTechSupportStatus,
  });

  @override
  BaseState<MaintainanceRequestWidget> baseCreateState() =>
      _MaintainanceRequestWidgetState();
}

class _MaintainanceRequestWidgetState
    extends BaseState<MaintainanceRequestWidget> {
  int _supportStatusSelected = 0;
  bool _isBottomSheetButtonClicked = false;
  String _bottomSheetFromDate =
      DateFormat('d/M/y').format(DateTime.now()).toString();
  String _bottomSheetToDate =
      DateFormat('d/M/y').format(DateTime.now()).toString();
  DateTime _bottomSheetSelectedFromDate = DateTime.now();
  DateTime _bottomSheetSelectedToDate = DateTime.now();
  GetSupportNumber _getSupportNumber = const GetSupportNumber();
  final List<GetTechSupportStatus> _getTechSupportStatus = [];
  bool _isClickedFilterButton = false;
  bool _isOpacityFilterButton = false;

  DashboardBloc get _bloc => BlocProvider.of<DashboardBloc>(context);
  bool isResponseReturnSuccess = false;

  @override
  void initState() {
    super.initState();
    _getTechSupportStatus.addAll(widget.getTechSupportStatus);
    _bloc.add(
      DashboardGetSupportRequestNumbersEvent(
        bottomSheetFromDate: convertDateToTimeZoneEnglish(
            _bottomSheetSelectedFromDate.toString().trim()),
        bottomSheetToDate: convertDateToTimeZoneEnglish(
            _bottomSheetSelectedToDate.toString().trim()),
        supportStatusId: -1,
        supportStatusIndex: -1,
        isComeFromBottomSheet: false,
      ),
    );
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is DashboardGetLookupRowsError) {
          _showDialog(context: context, errorMessage: state.errorMessage);
        } else if (state is DashboardGetSupportRequestNumbersSuccess) {
          isResponseReturnSuccess = true;
          _isClickedFilterButton = state.isButtonClicked;
          _isOpacityFilterButton = state.isButtonOpacity;
          if (state.isComeFromBottomSheet) {
            _bottomSheetFromDate =
                formaterDateToDayMonthYear(state.bottomSheetFromDate);
            _bottomSheetToDate =
                formaterDateToDayMonthYear(state.bottomSheetToDate);
            _supportStatusSelected = state.supportStatusIndex;
            _isBottomSheetButtonClicked = true;
          }
          hideLoading();
          _getSupportNumber = state.getSupportRequestNumbers;
        } else if (state is DashboardGetSupportRequestNumbersError) {
          _showDialog(context: context, errorMessage: state.errorMessage);
          hideLoading();
        } else if (state is DashboardGetSupportRequestNumbersLoading) {
          showLoading();
        } else if (state is DashBoardBottomSheetCloseState) {
          _isClickedFilterButton = state.isButtonClicked;
          _isOpacityFilterButton = state.isButtonOpacity;
          _bloc.add(DashboardPopBackEvent());
        } else if (state is DashboardIsOpacityFilterButtonFromMaintainance) {
          _isOpacityFilterButton = state.isCanOpacity;
        } else if (state is DashboardPopBackState) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: MaintainanceRequestCardWidget(
            getSupportNumber: _getSupportNumber,
            isResponseReturnSuccess: isResponseReturnSuccess,
            onTap: () {
              if (!_isClickedFilterButton) {
                _isClickedFilterButton = true;
                _bloc.add(DashboardIsOpacityFilterButtonFromMaintainanceEvent(
                    isCanOpacity: _isOpacityFilterButton));
                Future.delayed(const Duration(
                  milliseconds: 1000,
                )).then((value) {
                  _bloc.add(DashboardIsOpacityFilterButtonFromMaintainanceEvent(
                      isCanOpacity: _isOpacityFilterButton));
                  _showBottomSheet(context);
                });
              }
            },
            isClickedFilterButton: _isClickedFilterButton,
            isOpacityFilterButton: _isOpacityFilterButton,
          ),
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    showBottomSheetWidget(
      context: context,
      isDismissible: false,
      onClose: () {
        _bloc.add(DashBoardBottomSheetCloseEvent());
      },
      content: BottomSheetContentWidget(
        getTechSupportStatus: _getTechSupportStatus,
        supportStatusSelected: _supportStatusSelected,
        fromDate: _bottomSheetFromDate,
        toDate: _bottomSheetToDate,
        selectedFromDate: _bottomSheetSelectedFromDate,
        selectedToDate: _bottomSheetSelectedToDate,
        isButtonClicked: _isBottomSheetButtonClicked,
        onConfirmPressed: ({
          required String toDate,
          required String toDateSelected,
          required String fromDate,
          required String fromDateSelected,
          required int supportStatusIndex,
        }) {
          _bloc.add(DashboardPopBackEvent());
          _bottomSheetFromDate = fromDate;
          _bottomSheetToDate = toDate;
          _bottomSheetSelectedFromDate = DateTime.parse(fromDateSelected);
          _bottomSheetSelectedToDate = DateTime.parse(toDateSelected);
          _bloc.add(
            DashboardGetSupportRequestNumbersEvent(
              bottomSheetFromDate:
                  convertDateToTimeZoneEnglish(fromDateSelected),
              bottomSheetToDate: convertDateToTimeZoneEnglish(toDateSelected),
              supportStatusId:
                  widget.getTechSupportStatus.elementAt(supportStatusIndex).id,
              supportStatusIndex: supportStatusIndex,
              isComeFromBottomSheet: true,
            ),
          );
        },
      ),
      height: 323,
    );
  }

  void _showDialog({
    required BuildContext context,
    required String errorMessage,
  }) {
    showMessageDialogWidget(
        context: context,
        text: errorMessage,
        icon: ImagePaths.icCancelNew,
        buttonText: S.current.ok,
        onTap: () {
          _bloc.add(DashboardPopBackEvent());
        });
  }
}
