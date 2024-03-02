import 'package:city_eye/src/presentation/widgets/bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

Future showBottomSheetWidget({
  required BuildContext context,
  required Widget content,
  String? titleLabel,
  double height = 300,
  bool isDismissible = true,
  bool isPadding = true,
  Function()? onClose,
}) async {
  return await showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    enableDrag: false,
    isDismissible: isDismissible,
    isScrollControlled: true,
    builder: (context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: BottomSheetWidget(
        height: height > MediaQuery.of(context).size.height * 0.7
            ? MediaQuery.of(context).size.height * 0.7
            : height,
        content: content,
        titleLabel: titleLabel ?? "",
        isPadding: isPadding,
        onClose: onClose,
      ),
    ),
  );
}
