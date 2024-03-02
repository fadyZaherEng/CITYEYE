import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QrCodeWidget extends StatelessWidget {
  final String compoundName;

  const QrCodeWidget({
    super.key,
    required this.compoundName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 127,
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Stack(
              children: [
                Container(
                  height: 111,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: ColorSchemes.white,
                    borderRadius: BorderRadiusDirectional.all(
                      Radius.circular(16),
                    ),
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Color(0xFFDEDEDE),
                      ),
                      left: BorderSide(
                        width: 1,
                        color: Color(0xFFDEDEDE),
                      ),
                      right: BorderSide(
                        width: 1,
                        color: Color(0xFFDEDEDE),
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).createYourQrCode,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: ColorSchemes.black,
                                    ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            S.of(context).itIsLongEstablishedFactThat,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: ColorSchemes.black,
                                ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            compoundName,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: ColorSchemes.primary,
                                    ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  margin: const EdgeInsetsDirectional.only(end: 150, start: 12),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(25),
                    border: const Border(
                      top: BorderSide(
                        width: 0.4,
                        color: Color(0xFFDEDEDE),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: SvgPicture.asset(
              ImagePaths.qrCodePayment,
              height: 127,
              width: 127,
              fit: BoxFit.fill,
              matchTextDirection: true,
            ),
          )
        ],
      ),
    );
  }
}
