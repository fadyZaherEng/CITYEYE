import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomEmptyListWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final Function() onRefresh;

  const CustomEmptyListWidget(
      {required this.imagePath,
      required this.text,
      required this.onRefresh,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imagePath,
            fit: BoxFit.scaleDown,
          ),
          const SizedBox(
            height: 32.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: ColorSchemes.black,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: onRefresh,
                  child: SvgPicture.asset(
                    ImagePaths.refresh,
                    matchTextDirection: true,
                    width: 32,
                    height: 32,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
