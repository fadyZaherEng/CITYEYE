import 'dart:convert';
import 'dart:developer';

import 'package:city_eye/src/data/sources/remote/city_eye/firebase_notification/firebase_notification.dart';
import 'package:city_eye/src/di/injector.dart';
import 'package:city_eye/src/domain/usecase/get_notification_use_case.dart';
import 'package:city_eye/src/domain/usecase/save_firebase_notification_token_usecase.dart';
import 'package:city_eye/src/domain/usecase/set_notification_use_case.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

final didReceiveLocalNotificationSubject =
    BehaviorSubject<FirebaseNotification>();

class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final onNotificationClick = BehaviorSubject<String?>();

  String get androidNotificationChannelName => "Notification";

  String get androidNotificationChannelId => "Notification";

  Future<void> initializeNotificationService() async {
    NotificationSettings notificationSettings =
        await _setupNotificationPermission();
    _configMessage();

    String notificationToken = "";

    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      await SetNotificationStatusUseCase(injector())(true);
    } else if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      await SetNotificationStatusUseCase(injector())(true);
    } else if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.denied) {
      await SetNotificationStatusUseCase(injector())(false);
    } else if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.notDetermined) {
      await SetNotificationStatusUseCase(injector())(false);
    }

    if (GetNotificationStatusUseCase(injector())() == true) {
      try {
        notificationToken = await messaging.getToken() ?? "";
      } catch (e) {
        log(e.toString());
      }
    }

    await SaveFirebaseNotificationTokenUseCase(injector())(
      firebaseNotificationToken: notificationToken,
    );

    if (kDebugMode) {
      log("MyToken: $notificationToken");
    }
  }

  FlutterLocalNotificationsPlugin get _getFlutterLocalNotificationsPlugin =>
      FlutterLocalNotificationsPlugin();

  Future<void> get _getFlutterLocalNotificationsPluginInitializer =>
      _getFlutterLocalNotificationsPlugin.initialize(_getInitializationSettings,
          onDidReceiveNotificationResponse: (notificationResponse) {
        onNotificationClick.add(notificationResponse.payload);
      });

  AndroidInitializationSettings get _getAndroidInitializationSettings =>
      const AndroidInitializationSettings('@mipmap/ic_notifications');

  final DarwinInitializationSettings _initializationSettingsIOS =
      DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: true,
          requestSoundPermission: false,
          onDidReceiveLocalNotification: (
            int id,
            String? title,
            String? body,
            String? payload,
          ) async {
            didReceiveLocalNotificationSubject.add(
              FirebaseNotification(
                id: id,
                title: title,
                body: body,
                payload: payload,
              ),
            );
          });

  InitializationSettings get _getInitializationSettings =>
      InitializationSettings(
          android: _getAndroidInitializationSettings,
          iOS: _initializationSettingsIOS);

  Future _setupNotificationPermission() async {
    return await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  NotificationDetails get _getNotificationDetails => NotificationDetails(
      android: _getAndroidNotificationDetails, iOS: _getIOSNotificationDetails);

  DarwinNotificationDetails get _getIOSNotificationDetails =>
      const DarwinNotificationDetails();

  AndroidNotificationDetails get _getAndroidNotificationDetails =>
      AndroidNotificationDetails(
        androidNotificationChannelId,
        androidNotificationChannelName,
        importance: Importance.max,
        priority: Priority.max,
        playSound: true,
        channelShowBadge: true,
        enableLights: true,
        autoCancel: true,
        enableVibration: true,
        channelAction: AndroidNotificationChannelAction.createIfNotExists,
        icon: '@mipmap/ic_notifications',
      );

  void _showNotificationAsLocal(
      {String? title, String? message, Map<String, dynamic>? data}) async {
    await _getFlutterLocalNotificationsPluginInitializer.whenComplete(() async {
      await _getFlutterLocalNotificationsPlugin.show(
          0, title, message, _getNotificationDetails,
          payload: json.encode(data));
    });
  }

  void _configMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      _setNotificationMessage(message, false);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      onNotificationClick.add(json.encode(message.data));
    });
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        onNotificationClick.add(json.encode(message.data));
      }
    });
  }

  void _setNotificationMessage(RemoteMessage message, bool isBackGround) {
    _showNotificationAsLocal(
        data: message.data,
        message: message.notification?.body ?? "",
        title: message.notification?.title ?? "");
  }
}
