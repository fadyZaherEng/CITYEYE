import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/show_massage_dialog_widget.dart';
import 'package:city_eye/src/domain/entities/home/qr_code_details.dart';
import 'package:city_eye/src/domain/entities/home/security/units_qr_code_days.dart';
import 'package:flutter/cupertino.dart';

sealed class QrCodeDetailsHelper {
  static showMessageDialogError({
    required BuildContext context,
    bool isMultiPop = false,
    required String errorMessage,
  }) =>
      showMessageDialogWidget(
        context: context,
        text: errorMessage,
        icon: ImagePaths.icCancelNew,
        buttonText: S.of(context).ok,
        onTap: () {
          Navigator.of(context).pop();
          if (isMultiPop) {
            Navigator.of(context).pop();
          }
        },
      );

  static List<String> extractDays({required QrCodeDetails qrCodeDetails}) {
    List<UnitsQrCodeDays> unitsQrCodeDays =
        qrCodeDetails.unitsQRCodeScanned.unitsQRCodeDays;

    List<String> days =
        unitsQrCodeDays.map((day) => day.weekDays.name).toList();
    return days.toSet().toList();
  }

  static String convertDaysToText({required List<String> days}) =>
      days.join(' - ');
}
