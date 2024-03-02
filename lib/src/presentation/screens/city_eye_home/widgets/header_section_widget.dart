import 'package:badges/badges.dart' as badge;
import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/constants.dart';
import 'package:city_eye/src/di/injector.dart';
import 'package:city_eye/src/domain/entities/home/notification_count.dart';
import 'package:city_eye/src/domain/entities/sign_in/unit_list.dart';
import 'package:city_eye/src/domain/entities/sign_in/user_info.dart';
import 'package:city_eye/src/domain/usecase/get_language_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeSectionWidget extends StatelessWidget {
  final UserInfo userInfo;
  final UnitLists unitLists;
  final NotificationCount notificationCount;
  final Function() onNotificationTapped;

  const HomeSectionWidget({
    Key? key,
    required this.notificationCount,
    required this.onNotificationTapped,
    required this.unitLists,
    required this.userInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorSchemes.primary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  userInfo.image,
                  fit: BoxFit.fill,
                  errorBuilder: (
                    context,
                    error,
                    stackTrace,
                  ) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: SvgPicture.asset(
                        ImagePaths.profile,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  userInfo.userName,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ColorSchemes.black,
                      ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      "${unitLists.userTypeName} - ${S.of(context).UnitNo} ${unitLists.unitNo} - ",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ColorSchemes.gray,
                          ),
                    ),
                    Text(
                      unitLists.compoundName,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ColorSchemes.primary,
                          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: SvgPicture.asset(
                        ImagePaths.arrowdown2,
                        width: 12,
                        height: 12,
                        color: ColorSchemes.primary,
                        fit: BoxFit.scaleDown,
                        matchTextDirection: true,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        const Expanded(child: SizedBox()),
        InkWell(
          onTap: () {
            onNotificationTapped();
          },
          child: badge.Badge(
              badgeContent: SizedBox(
                child: Center(
                  child: Padding(
                    padding:
                        EdgeInsets.all(notificationCount.count > 99 ? 5 : 2),
                    child: Text(
                      notificationCount.count <= 999
                          ? notificationCount.count.toString()
                          : GetLanguageUseCase(injector())() == "ar"
                              ? "999+"
                              : "+999",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: ColorSchemes.white,
                          fontSize: notificationCount.count > 99 ? 10 : 12,
                          fontWeight: Constants.fontWeightSemiBold),
                    ),
                  ),
                ),
              ),
              badgeAnimation: const badge.BadgeAnimation.scale(
                  animationDuration: Duration(milliseconds: 0)),
              badgeStyle: const badge.BadgeStyle(
                badgeColor: ColorSchemes.primary,
                padding: EdgeInsets.all(2),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              position: badge.BadgePosition.topStart(
                  top: notificationCount.count > 99 ? -8 : -2,
                  start: notificationCount.count > 99 ? 10 : 12),
              child: SvgPicture.asset(
                ImagePaths.notification,
                fit: BoxFit.scaleDown,
              )),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
