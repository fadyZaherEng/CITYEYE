import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BadgeDetailsItemWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final String path;
  final String value;

  const BadgeDetailsItemWidget({
    super.key,
    this.onPressed,
    required this.title,
    required this.path,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Row(
              children: [
                InkWell(onTap: onPressed, child: SvgPicture.asset(path)),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ColorSchemes.gray,
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Text(
              value,
              maxLines: 5,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ColorSchemes.black,
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
