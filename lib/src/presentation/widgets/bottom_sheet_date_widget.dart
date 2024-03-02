// ignore_for_file: deprecated_member_use

import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomSheetDateWidget extends StatelessWidget {
  bool? isSelectedDate;
  final String date;
  final String path;
  final void Function() onTap;

  BottomSheetDateWidget({
    super.key,
    this.isSelectedDate = true,
    required this.date,
    required this.path,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 28,
        padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
        decoration: BoxDecoration(
          color: isSelectedDate == true ? ColorSchemes.primary : Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isSelectedDate == true
                ? ColorSchemes.primary
                : const Color(0xFFC7C4CC),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              path,
              color: isSelectedDate == true
                  ? ColorSchemes.white
                  : const Color(0xFFC7C4CC),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              date,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: isSelectedDate == true
                        ? ColorSchemes.white
                        : const Color(0xFFC7C4CC),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
