import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/routes/routes_manager.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/convert_timestamp_to_date_format.dart';
import 'package:city_eye/src/core/utils/show_massage_dialog_widget.dart';
import 'package:city_eye/src/domain/entities/notification/notification_item.dart';
import 'package:city_eye/src/presentation/blocs/notifications/notification_details/notification_details_bloc.dart';
import 'package:city_eye/src/presentation/screens/notifications/notifications_details_screen/skeleton/skeleton_notifications_details_screen.dart';
import 'package:city_eye/src/presentation/screens/notifications/notifications_details_screen/widgets/gallery_image_widget.dart';
import 'package:city_eye/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class NotificationDetailsScreen extends BaseStatefulWidget {
  NotificationDetailsScreen({
    required this.isPushedNotification,
    required this.notificationDetails,
    required this.notificationId,
    super.key,
  });

  bool isPushedNotification = false;
  NotificationItem notificationDetails;
  int notificationId;

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _NotificationDetailsScreenState();
}

class _NotificationDetailsScreenState
    extends BaseState<NotificationDetailsScreen> {
  NotificationDetailsBloc get _bloc =>
      BlocProvider.of<NotificationDetailsBloc>(context);

  NotificationItem _notificationItem = const NotificationItem();

  @override
  void initState() {
    if (widget.isPushedNotification) {
      _bloc.add(GetNotificationDetailsDataEvent(
          notificationId: widget.notificationId));
    } else {
      _bloc.add(SetLocalNotificationDetailsDataEvent());
    }
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWidget(context,
          title: S.of(context).notificationDetails,
          isHaveBackButton: true, onBackButtonPressed: () {
        _bloc.add(BackEvent());
      }),
      body: BlocConsumer<NotificationDetailsBloc, NotificationDetailsState>(
        listener: (context, state) {
          if (state is BackState) {
            _backDestination();
          } else if (state is ShowSkeletonState) {
          } else if (state is GetNotificationDetailsSuccessState) {
            _notificationItem = state.notificationItem;
            //_updateNotificationsSeenEvent();
          } else if (state is GetNotificationDetailsErrorState) {
            showMessageDialogWidget(
              context: context,
              text: state.errorMessage,
              icon: ImagePaths.icCancelNew,
              buttonText: S.of(context).ok,
              onTap: () => {
                Navigator.pop(context),
                _backDestination(),
              },
            );
          } else if (state is SetLocalNotificationDetailsDataState) {
            _notificationItem = widget.notificationDetails;
            //_updateNotificationsSeenEvent();
          }
        },
        builder: (context, state) {
          return state is ShowSkeletonState
              ? const SkeletonNotificationDetailsScreen()
              : Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(children: [
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Text(
                          _notificationItem.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: ColorSchemes.black,
                                  ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        convertTimestampToDateFormat(
                            _notificationItem.createDate),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: ColorSchemes.primary,
                              fontSize: 12,
                            ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                    ]),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: _notificationItem.attachment.isNotEmpty,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, bottom: 12),
                                child: SizedBox(
                                  height: 160,
                                  width: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: GalleryImageWidget(
                                      image: _notificationItem.attachment,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                _notificationItem.body,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: ColorSchemes.gray,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  void _backDestination() {
    if (widget.isPushedNotification) {
      Navigator.pushReplacementNamed(
        context,
        Routes.notifications,
      ); //(route) => false
    } else {
      Navigator.pop(context);
    }
  }
}
