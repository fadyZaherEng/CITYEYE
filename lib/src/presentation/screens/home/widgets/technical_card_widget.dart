import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/core/utils/constants.dart';
import 'package:city_eye/src/core/utils/convert_timestamp_to_date_format.dart';
import 'package:city_eye/src/core/utils/extension/color_extension.dart';
import 'package:city_eye/src/domain/entities/support/support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/theme/color_schemes.dart';
import '../../../../core/resources/image_paths.dart';

class TechnicalCardWidget extends StatelessWidget {
  final Support job;

  final Function(Support) onTapCardWidget;

  const TechnicalCardWidget({
    super.key,
    required this.job,
    required this.onTapCardWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () {
          onTapCardWidget(job);
        },
        child: Container(
          decoration: BoxDecoration(
            color: ColorSchemes.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                  color: ColorSchemes.lightGray,
                  offset: Offset(0, 1),
                  blurRadius: 30,
                  spreadRadius: 0)
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0 , 8.0, 8.0, 0.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: ColorSchemes.searchBackground,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        Text(
                          '#${job.requestId}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: ColorSchemes.black,
                                  letterSpacing: -0.16),
                        ),
                        const Spacer(),
                        SvgPicture.network(
                          job.supportCategory.logo,
                          fit: BoxFit.scaleDown,
                          matchTextDirection: true,
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          job.supportCategory.name,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontWeight: Constants.fontWeightRegular,
                                    color: ColorSchemes.black,
                                  ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    SvgPicture.asset(ImagePaths.unit),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      S.of(context).unit,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorSchemes.gray,
                            letterSpacing: -0.16,
                            fontSize: 16.0,
                          ),
                    ),
                    const SizedBox(
                      width: 56.0,
                    ),
                    Text(
                      job.supportUserUnits.name,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorSchemes.black,
                            letterSpacing: -0.16,
                            fontSize: 16.0,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    SvgPicture.asset(ImagePaths.date),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      S.of(context).date,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorSchemes.gray,
                            letterSpacing: -0.16,
                            fontSize: 16.0,
                          ),
                    ),
                    const SizedBox(
                      width: 53.0,
                    ),
                    Text(
                      convertTimestampToDateFormat(job.requestDate),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorSchemes.black,
                            letterSpacing: -0.16,
                            fontSize: 16.0,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    SvgPicture.asset(ImagePaths.status),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      S.of(context).status,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: ColorSchemes.gray,
                            letterSpacing: -0.16,
                            fontSize: 16.0,
                          ),
                    ),
                    const SizedBox(
                      width: 44.0,
                    ),
                    Container(
                      width: 7.0,
                      height: 7.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: job.supportTechStatus.code.toColor,
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      job.supportTechStatus.statusName,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: job.supportTechStatus.code.toColor,
                            letterSpacing: -0.16,
                            fontSize: 16.0,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
