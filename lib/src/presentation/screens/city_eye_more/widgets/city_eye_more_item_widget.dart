import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CityEyeMoreItemWidget extends StatelessWidget {
  final String title;
  final String icon;
  final bool isMandatory;

  final void Function() onItemTapped;

  const CityEyeMoreItemWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.isMandatory,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isMandatory,
      child: InkWell(
        onTap: onItemTapped,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 24,
                height: 24,
                matchTextDirection: true,
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: ColorSchemes.black),
              ),
              const Spacer(),
              SvgPicture.asset(
                ImagePaths.arrowright2,
                width: 24,
                height: 24,
                matchTextDirection: true,
                color: ColorSchemes.gray,
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
