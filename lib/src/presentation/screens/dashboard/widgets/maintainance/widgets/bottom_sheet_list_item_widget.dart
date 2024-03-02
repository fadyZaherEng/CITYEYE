import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';

class BottomSheetListItemWidget extends StatelessWidget {
  final int currentIndex;
  final int selectedIndex;
  final String lookupFilesName;
  final void Function() onTap;

  const BottomSheetListItemWidget({
    super.key,
    required this.lookupFilesName,
    required this.onTap,
    required this.currentIndex,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Container(
          //  width: 52,
          height: 28,
          padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
          decoration: BoxDecoration(
            color: selectedIndex == currentIndex
                ? ColorSchemes.primary
                : ColorSchemes.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: selectedIndex == currentIndex
                  ? ColorSchemes.primary
                  : ColorSchemes.dashBoardBottomSheetListItemBorderColor,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              lookupFilesName,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: selectedIndex == currentIndex
                        ? ColorSchemes.white
                        : ColorSchemes.dashBoardBottomSheetListItemBorderColor,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
