import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomSheetWidget extends StatelessWidget {
  final Widget content;
  final String titleLabel;
  final double height;
  final bool isPadding;
  final Function()? onClose;

  const BottomSheetWidget({
    Key? key,
    required this.content,
    required this.titleLabel,
    this.onClose,
    this.height = 300,
    this.isPadding = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      constraints: BoxConstraints(
        minHeight: height,
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      decoration: const BoxDecoration(
        color: ColorSchemes.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          topLeft: Radius.circular(32),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(32),
          topLeft: Radius.circular(32),
        ),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: InkWell(
                onTap: () {
                  if (onClose != null) {
                    onClose!();
                  } else {
                    Navigator.of(context).pop();
                  }
                },
                child: Padding(
                  padding: titleLabel != null
                      ? const EdgeInsets.all(16)
                      : const EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 0.0),
                  child: SvgPicture.asset(
                    ImagePaths.close,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            titleLabel.isEmpty
                ? const SizedBox.shrink()
                : Column(
                    children: [
                      Text(
                        titleLabel,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorSchemes.black,
                            fontSize: 18,
                            letterSpacing: -0.24),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: isPadding ? 16 : 0.0, vertical: 0.0),
                  child: content),
            ),
          ],
        ),
      ),
    );
  }
}
