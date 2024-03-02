import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/routes/routes_manager.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/show_message_dialog_widget.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/notifications/request/notification_seen_request.dart';
import 'package:city_eye/src/domain/entities/notification/notification_item.dart';
import 'package:city_eye/src/presentation/blocs/notifications/notifications_bloc.dart';
import 'package:city_eye/src/presentation/screens/notifications/notifications_screen/skeleton/skeleton_notification_screen.dart';
import 'package:city_eye/src/presentation/screens/notifications/notifications_screen/widgets/empty_notification_widget.dart';
import 'package:city_eye/src/presentation/screens/notifications/notifications_screen/widgets/notification_list_item_widget.dart';
import 'package:city_eye/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsScreen extends BaseStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends BaseState<NotificationsScreen> {
  NotificationsBloc get _bloc => BlocProvider.of<NotificationsBloc>(context);

  List<NotificationItem> _notifications = [];

  @override
  void initState() {
    _bloc.add(GetNotificationsDataEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSchemes.white,
      appBar: buildAppBarWidget(context,
          title: S.of(context).notifications,
          isHaveBackButton: true, onBackButtonPressed: () {
        _bloc.add(NotificationsPopEvent());
      }),
      body: BlocConsumer<NotificationsBloc, NotificationsState>(
        listener: (context, state) {
          if (state is ShowLoadingState) {
            showLoading();
          } else if (state is HideLoadingState) {
            hideLoading();
          } else if (state is GetNotificationsSuccessState) {
            _notifications = state.notifications.reversed.toList();
          } else if (state is NotificationsPopState) {
            Navigator.pop(context);
          } else if (state is UpdateNotificationSeenSuccessState) {
            _notifications = List<NotificationItem>.from(_notifications.map(
                (e) => e.id == state.notificationItem.id
                    ? e.copyWith(isSeen: true)
                    : e));
            _onClickActionEvent(state.notificationItem);
          } else if (state is UpdateNotificationSeenFailedState) {
            _showMessageDialog(state.errorMessage);
          }
        },
        builder: (context, state) {
          return state is ShowSkeletonState
              ? const SkeletonNotificationScreen()
              : _notifications.isEmpty
                  ? EmptyNotificationWidget(
                      onRefresh: () {
                        _bloc.add(GetNotificationsDataEvent());
                      },
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  NotificationListItemWidget(
                                notification: _notifications[index],
                                updateNotificationsSeenEvent:
                                    (notificationItem) {
                                  if (!notificationItem.isSeen) {
                                    _updateNotificationsSeenEvent(
                                      notificationItem,
                                    );
                                  } else {
                                    _onClickActionEvent(notificationItem);
                                  }
                                },
                              ),
                              itemCount: _notifications.length,
                            ),
                          ),
                        ],
                      ),
                    );
        },
      ),
    );
  }

  void _onClickActionEvent(NotificationItem notificationItem) {
    if (notificationItem.notificationSource.code == "qrDetails" ||
        notificationItem.notificationSource.code == "current_qrHistory" ||
        notificationItem.notificationSource.code == "previous_qrHistory") {
      _navigateToQrDetailsScreen(int.parse(notificationItem.targetId));
    } else if (notificationItem.notificationSource.code == "support_comments") {
      Navigator.pushNamed(context, Routes.comments,
          arguments: int.parse(notificationItem.targetId));
    } else if (notificationItem.notificationSource.code == "supportDetails" ||
        notificationItem.notificationSource.code == "open_support" ||
        notificationItem.notificationSource.code == "all_support" ||
        notificationItem.notificationSource.code == "support_completed" ||
        notificationItem.notificationSource.code
            .toLowerCase()
            .contains("support") ||
        notificationItem.notificationSource.code
            .toLowerCase()
            .contains("job")) {
      _navigateToJobDetailsScreen(int.parse(notificationItem.targetId));
    } else if (notificationItem.notificationSource.code == "TechUnitsQr") {
      Navigator.pushNamedAndRemoveUntil(context, Routes.main, (route) => false);
    } else {
      Navigator.pushNamed(
        context,
        Routes.notificationDetails,
        arguments: {
          "isPushedNotification": false,
          "details": notificationItem,
          "id": notificationItem.id
        },
      );
    }
  }

  void _updateNotificationsSeenEvent(NotificationItem notificationItem) {
    NotificationSeenRequest notificationSeenRequest = NotificationSeenRequest(
      notificationId: int.parse(notificationItem.notificationId),
    );
    _bloc.add(
      UpdateNotificationSeenEvent(
        notificationSeenRequest: notificationSeenRequest,
        notificationItem: notificationItem,
      ),
    );
  }

  Future<void> _navigateToQrDetailsScreen(int id) async {
    await Navigator.of(context).pushNamed(Routes.qrDetails, arguments: {
      "qrCodeDetailsIdOrPinCode": id,
      'isComeFromQrScanner': false,
    });
  }

  void _navigateToJobDetailsScreen(int id) {
    Navigator.of(context).pushNamed(Routes.jobDetails, arguments: id);
  }

  void _showMessageDialog(String errorMessage) {
    showMessageDialogWidget(
        context: context,
        text: errorMessage,
        icon: ImagePaths.icCancelNew,
        buttonText: S.of(context).ok,
        onTap: () => {
              Navigator.pop(context),
            });
  }
}
