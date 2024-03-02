// ignore_for_file: must_be_immutable

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/formate_day_to_day_month_year.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_tech_support_status.dart';
import 'package:city_eye/src/presentation/screens/dashboard/utils/show_dashboard_date_picker.dart';
import 'package:city_eye/src/presentation/widgets/bottom_sheet_date_widget.dart';
import 'package:city_eye/src/presentation/widgets/bottom_sheet_header_widget.dart';
import 'package:city_eye/src/presentation/widgets/confirm_button_widget.dart';
import 'package:city_eye/src/presentation/widgets/custom_button_option_widget.dart';
import 'package:flutter/material.dart';

class BottomSheetContentWidget extends StatefulWidget {
  final List<GetTechSupportStatus> getTechSupportStatus;
  bool isButtonClicked;
  int supportStatusSelected;
  String fromDate;
  String toDate;
  DateTime selectedFromDate;
  DateTime selectedToDate;
  final void Function({
    required String toDate,
    required String toDateSelected,
    required String fromDate,
    required String fromDateSelected,
    required int supportStatusIndex,
  }) onConfirmPressed;

  BottomSheetContentWidget({
    super.key,
    required this.getTechSupportStatus,
    required this.isButtonClicked,
    required this.supportStatusSelected,
    required this.onConfirmPressed,
    required this.fromDate,
    required this.toDate,
    required this.selectedFromDate,
    required this.selectedToDate,
  });

  @override
  State<BottomSheetContentWidget> createState() =>
      _BottomSheetContentWidgetState();
}

class Category {}

class _BottomSheetContentWidgetState extends State<BottomSheetContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomSheetHeaderWidget(
            path: ImagePaths.icFilter,
            title: S.current.requestsFilter,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            S.current.date,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ColorSchemes.black,
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 28,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  BottomSheetDateWidget(
                      date: widget.fromDate,
                      path: ImagePaths.icCalendar,
                      onTap: () {
                        _showDatePicker(
                          context: context,
                          isToDate: false,
                        );
                      }),
                  const SizedBox(
                    width: 15,
                  ),
                  BottomSheetDateWidget(
                      date: widget.toDate,
                      path: ImagePaths.icTimer,
                      onTap: () {
                        _showDatePicker(
                          context: context,
                          isToDate: true,
                        );
                      }),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            S.current.supportStatus,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ColorSchemes.black,
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 28,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomButtonOptionWidget(
                  onTap: () {
                    setState(() {
                      widget.supportStatusSelected = index;
                    });
                  },
                  buttonTitle: widget.getTechSupportStatus[index].name,
                  height: 28,
                  isSelected: index == widget.supportStatusSelected,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: widget.getTechSupportStatus.length,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ConfirmButtonWidget(
            onTap: () {
              widget.onConfirmPressed(
                fromDateSelected: widget.selectedFromDate.toString(),
                toDateSelected: widget.selectedToDate.toString(),
                toDate: widget.toDate,
                fromDate: widget.fromDate,
                supportStatusIndex: widget.supportStatusSelected,
              );
            },
          ),
        ],
      ),
    );
  }

  void _showDatePicker({
    required BuildContext context,
    required bool isToDate,
  }) {
    showDashboardDatePicker(
      context: context,
      isToDate: isToDate,
      selectedToDate: widget.selectedToDate,
      selectedFromDate: widget.selectedFromDate,
      onSelectDate: (dateTime) {
        _datePickerChange(
          isToDate: isToDate,
          dateTime: dateTime ?? DateTime.now(),
        );
      },
      onCancel: () {
        Navigator.of(context).pop();
        setState(() {
          isToDate
              ? widget.toDate =
                  formaterDateToDayMonthYear(DateTime.now().toString())
              : widget.fromDate =
                  formaterDateToDayMonthYear(DateTime.now().toString());
        });
      },
      onDone: () {
        Navigator.of(context).pop();
      },
    );
  }

  void _datePickerChange({
    required bool isToDate,
    required DateTime dateTime,
  }) {
    setState(() {
      isToDate
          ? widget.selectedToDate = dateTime
          : widget.selectedFromDate = dateTime;
      isToDate
          ? widget.toDate = formaterDateToDayMonthYear(dateTime.toString())
          : widget.fromDate = formaterDateToDayMonthYear(dateTime.toString());
    });
  }
}
