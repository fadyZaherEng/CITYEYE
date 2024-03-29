import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/utils/constants.dart';
import 'package:city_eye/src/core/utils/convert_timestamp_to_date_format.dart';
import 'package:city_eye/src/domain/entities/notification/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class NotificationListItemWidget extends StatelessWidget {
  final NotificationItem notification;
  final void Function(NotificationItem) updateNotificationsSeenEvent;

  const NotificationListItemWidget({
    super.key,
    required this.notification,
    required this.updateNotificationsSeenEvent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        updateNotificationsSeenEvent(notification);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 15),
        child: Container(
          decoration: BoxDecoration(
              color: notification.isSeen
                  ? ColorSchemes.white
                  : ColorSchemes.notificationItemUnSeenBackgroundColor,
              borderRadius: BorderRadiusDirectional.circular(15.0),
              border: Border.all(
                color: ColorSchemes.notificationItemBorderColor,
                width: 1,
              ),
              boxShadow: const [
                BoxShadow(
                  color: ColorSchemes.notificationItemBorderColor,
                  spreadRadius: 1,
                  blurRadius: 1,
                )
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                child: ClipOval(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: getPriorityColor(),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        "assets/images/ic_noti.svg",
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            notification.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: Constants.fontWeightMedium,
                                ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          convertTimestampToDateFormat(notification.createDate),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.deepPurple.shade600,
                                    fontSize: 13,
                                    fontWeight: Constants.fontWeightMedium,
                                    fontFamily: Constants.englishFontFamily,
                                  ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      notification.body,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.grey,
                          fontWeight: Constants.fontWeightRegular,
                          fontFamily: Constants.englishFontFamily),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getPriorityColor() {
    if (notification.notificationPriority.code == Constants.max) {
      return ColorSchemes.priorityMax;
    } else if (notification.notificationPriority.code == Constants.high) {
      return ColorSchemes.priorityHigh;
    } else {
      return ColorSchemes.priorityLow;
    }
  }
}
