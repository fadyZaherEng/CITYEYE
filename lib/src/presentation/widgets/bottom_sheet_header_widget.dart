import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomSheetHeaderWidget extends StatelessWidget {
  final String path;
  final String title;

  const BottomSheetHeaderWidget({
    super.key,
    required this.path,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          SvgPicture.asset(
            path,
            width: 24,
            height: 24,
            fit: BoxFit.scaleDown,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ColorSchemes.bottomSheetTitleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  fontFamily: "Montserrat",
                ),
          ),
        ],
      ),
    );
  }
}
