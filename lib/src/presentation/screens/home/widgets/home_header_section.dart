import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/constants.dart';
import 'package:city_eye/src/di/injector.dart';
import 'package:city_eye/src/domain/entities/home/notification_count.dart';
import 'package:city_eye/src/domain/entities/sign_in/user.dart';
import 'package:city_eye/src/domain/usecase/get_language_use_case.dart';
import 'package:city_eye/src/presentation/screens/home/widgets/user_information_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeaderSection extends StatelessWidget {
  final User user;
  final NotificationCount notificationCount;
  final Function() onNotificationTapped;

  const HomeHeaderSection({
    Key? key,
    this.user = const User(),
    required this.notificationCount,
    required this.onNotificationTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          UserInformationWidget(user: user),
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
            width: 16,
          )
        ],
      ),
    );
  }
}
