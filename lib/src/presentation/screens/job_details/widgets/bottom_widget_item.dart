import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class BottomWidgetItem extends StatelessWidget {
  String imagePath;
  String text;
  final void Function() onBottomItemTap;

  BottomWidgetItem(
      {required this.imagePath,
      required this.text,
      required this.onBottomItemTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBottomItemTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(imagePath, height: 32, width: 32),
          const SizedBox(height: 8),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: ColorSchemes.gray),
          )
        ],
      ),
    );
  }
}
