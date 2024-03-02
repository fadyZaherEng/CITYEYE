// ignore_for_file: deprecated_member_use, avoid_print, must_be_immutable

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/formate_day_to_day_month_year.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_qr_status.dart';
import 'package:city_eye/src/domain/entities/lock_up_data/get_lock_up_data_rows.dart';
import 'package:city_eye/src/presentation/screens/dashboard/utils/show_dashboard_date_picker.dart';
import 'package:city_eye/src/presentation/widgets/bottom_sheet_date_widget.dart';
import 'package:city_eye/src/presentation/widgets/bottom_sheet_header_widget.dart';
import 'package:city_eye/src/presentation/widgets/confirm_button_widget.dart';
import 'package:city_eye/src/presentation/widgets/custom_button_option_widget.dart';
import 'package:flutter/material.dart';

class BottomSheetContentWidget extends StatefulWidget {
  final List<LookupFiles> lookupFilesQr;
  final List<LookupFiles> lookupFilesGuest;
  final List<GetQrStatus> getQrStatus;
  final void Function({
    required String toDate,
    required String toDateSelected,
    required String fromDate,
    required String fromDateSelected,
    required int qrTypeIndex,
    required int guestTypeIndex,
    required int getQrStatusIndex,
  }) onConfirmPressed;
  bool isButtonClicked;
  int qrTypeSelectedIndex;
  int gustTypeSelectedIndex;
  int getQrStatusIndex;
  String fromDate;
  String toDate;
  DateTime selectedFromDate;
  DateTime selectedToDate;

  BottomSheetContentWidget({
    super.key,
    required this.lookupFilesGuest,
    required this.lookupFilesQr,
    required this.onConfirmPressed,
    required this.isButtonClicked,
    required this.qrTypeSelectedIndex,
    required this.gustTypeSelectedIndex,
    required this.fromDate,
    required this.toDate,
    required this.selectedFromDate,
    required this.selectedToDate,
    required this.getQrStatus,
    required this.getQrStatusIndex,
  });

  @override
  State<BottomSheetContentWidget> createState() =>
      _BottomSheetContentWidgetState();
}

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
            title: S.current.qRsScanFilter,
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
            S.current.gustType,
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
                      widget.gustTypeSelectedIndex = index;
                    });
                  },
                  buttonTitle: widget.lookupFilesGuest[index].name,
                  height: 28,
                  isSelected: index == widget.gustTypeSelectedIndex,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: widget.lookupFilesGuest.length,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            S.current.qrType,
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
                      widget.qrTypeSelectedIndex = index;
                    });
                  },
                  buttonTitle: widget.lookupFilesQr[index].name,
                  height: 28,
                  isSelected: index == widget.qrTypeSelectedIndex,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: widget.lookupFilesQr.length,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            S.current.qrStatus,
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
                      widget.getQrStatusIndex = index;
                    });
                  },
                  buttonTitle: widget.getQrStatus[index].name,
                  height: 28,
                  isSelected: index == widget.getQrStatusIndex,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: widget.getQrStatus.length,
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
                guestTypeIndex: widget.gustTypeSelectedIndex,
                qrTypeIndex: widget.qrTypeSelectedIndex,
                getQrStatusIndex: widget.getQrStatusIndex,
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
