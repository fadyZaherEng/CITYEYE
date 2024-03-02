import 'package:city_eye/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future iosDatePicker({
  required BuildContext context,
  required DateTime? selectedDate,
  required TextEditingController textEditingController,
  required Function(DateTime) onChange,
  required Function() onCancel,
  required Function() onDone,
}) =>
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.white,
            height: 300.0,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed:onCancel,
                      child: Text(
                        S.of(context).cancel,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: onDone,
                      child: Text(
                        S.of(context).done,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: CupertinoDatePicker(
                    initialDateTime: selectedDate ?? DateTime.now(),
                    minimumYear: DateTime.now().year,
                    maximumYear: 2100,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: onChange,
                  ),
                ),
              ],
            ),
          );
        });
