import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckStatisticItem extends StatelessWidget {
  final String pathIcon;
  final String titleOfChecking;
  final String value;

  const CheckStatisticItem({
    super.key,
    required this.pathIcon,
    required this.titleOfChecking,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(pathIcon),
        const SizedBox(
          height: 9.0,
        ),
        Text(
          titleOfChecking,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ColorSchemes.gray,
              ),
        ),
        const SizedBox(
          height: 9.0,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorSchemes.black,
                fontSize: 16.0,
              ),
        ),
      ],
    );
  }
}
