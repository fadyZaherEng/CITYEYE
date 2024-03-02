import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget getFloatingActionButtomWidget({
  required BuildContext context,
  required Function() onPressed,
  required Color backgroundColor,
  required String iconPath,
}) {
  return FloatingActionButton(
    onPressed: onPressed,
    elevation: 0.0,
    backgroundColor: backgroundColor,
    child: SvgPicture.asset(
      iconPath,
      fit: BoxFit.scaleDown,
    ),
  );
}
