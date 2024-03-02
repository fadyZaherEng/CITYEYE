import 'dart:io';

import 'package:city_eye/src/core/utils/image_type_enum.dart';
import 'package:city_eye/src/domain/entities/album_images/images_album.dart';
import 'package:city_eye/src/domain/entities/home/notification_count.dart';
import 'package:city_eye/src/domain/entities/home/qr_code_details.dart';
import 'package:city_eye/src/domain/entities/home/security/badge_scanned.dart';
import 'package:city_eye/src/domain/entities/home/security/delegation_scanned.dart';
import 'package:city_eye/src/domain/entities/home/security/user_unit_info.dart';
import 'package:city_eye/src/domain/entities/notification/notification_item.dart';
import 'package:city_eye/src/domain/entities/sign_in/user.dart';
import 'package:city_eye/src/presentation/screens/album_images_screen/album_images_screen.dart';
import 'package:city_eye/src/presentation/screens/authentication/forget_password/forget_password_screen.dart';
import 'package:city_eye/src/presentation/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:city_eye/src/presentation/screens/badge_details/badge_details_screen.dart';
import 'package:city_eye/src/presentation/screens/change_password/change_password_screen.dart';
import 'package:city_eye/src/presentation/screens/city_eye_home/home_screen.dart';
import 'package:city_eye/src/presentation/screens/city_eye_more/city_eye_more_screen.dart';
import 'package:city_eye/src/presentation/screens/comment/comments_screen.dart';
import 'package:city_eye/src/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:city_eye/src/presentation/screens/delegation_details/delegation_details_screen.dart';
import 'package:city_eye/src/presentation/screens/full_video_screen/full_video_screen.dart';
import 'package:city_eye/src/presentation/screens/job_details/job_details_screen.dart';
import 'package:city_eye/src/presentation/screens/main/main_screen.dart';
import 'package:city_eye/src/presentation/screens/main_city_eye/main_city_eye_screen.dart';
import 'package:city_eye/src/presentation/screens/notifications/notifications_details_screen/notifications_details_screen.dart';
import 'package:city_eye/src/presentation/screens/notifications/notifications_screen/notifications_screen.dart';
import 'package:city_eye/src/presentation/screens/play_video_screen/play_video_screen.dart';
import 'package:city_eye/src/presentation/screens/qr/scan/qr_scan_screen.dart';
import 'package:city_eye/src/presentation/screens/qr_details/qr_details_screen.dart';
import 'package:city_eye/src/presentation/screens/splash/splash_screen.dart';
import 'package:city_eye/src/presentation/screens/survey/survey_screen.dart';
import 'package:city_eye/src/presentation/widgets/video_trimmer_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Routes {
  static const String splash = "/";
  static const String login = "/login";
  static const String forgetPassword = "/forgetPassword";
  static const String main = "/main";
  static const String jobDetails = "/jobDetials";
  static const String albumImages = "/albumImages";
  static const String qrScan = "/qrScan";
  static const String more = '/more';
  static const String notifications = "/notifications";
  static const String notificationDetails = "/notificationDetails";
  static const String qrDetails = "/history_details";
  static const String changePassword = "/changePassword";
  static const String comments = '/comment';
  static const String fullVideoScreen = '/full_video_screen';

  static const String dashboardHomeScreen = '/dashboardHomeScreen';

  static const String delegateDetails = '/delegate_details';
  static const String badgeDetails = '/badge_details';
  static const String videoTrimmer = "/videoTrimmer";
  static const String playVideoScreen = "/playVideoScreen";
  static const String cityEyeHomeScreen = "/cityEyeHomeScreen";
  static const String surveyScreen = '/surveyScreen';
  static const String mainCityEyeScreen = '/moreCityEyeScreen';
  static const String cityEyeMoreScreen = '/CityEyeMoreScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.qrDetails:
        Map<String, dynamic> args =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(
          QrDetailsScreen(
            qrCodeDetailsIdOrQrScanner:
                args["qrCodeDetailsIdOrPinCode"] as int? ?? -1,
            isComeFromQrScanner: args["isComeFromQrScanner"] as bool? ?? false,
            validateVisitorQrCodeIn:
                args["qrCodeDetailsComeFromQrCode"] ?? const QrCodeDetails(),
          ),
        );
      /*case Routes.splash:
        return _materialRoute(const SplashScreen());*/
      case Routes.login:
        return _materialRoute(const SignInScreen());
      case Routes.forgetPassword:
        return _materialRoute(const ForgetPasswordScreen());

      case Routes.dashboardHomeScreen:
        return _materialRoute(DashboardScreen(
          user: routeSettings.arguments as User,
          notificationCount: routeSettings.arguments as NotificationCount,
        ));

      case Routes.delegateDetails:
        Map<String, dynamic> args =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(DelegationDetailsScreen(
          isValid: args["isValid"] as bool,
          delegationScanned:
              args["delegationScanned"] ?? const DelegationScanned(),
          userUnitInfo: args["userUnitInfo"] ?? const UserUnitInfo(),
        ));
      case Routes.badgeDetails:
        Map<String, dynamic> args =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(BadgeDetailsScreen(
          isValid: args["isValid"] as bool,
          badgeScanned: args["badgeScanned"] ?? const BadgeScanned(),
          userUnitInfo: args["userUnitInfo"] ?? const UserUnitInfo(),
        ));

      case Routes.main:
        return _materialRoute(
          const MainScreen(),
        );
      case Routes.jobDetails:
        int requestId = routeSettings.arguments as int;
        return _materialRoute(JobDetailsScreen(
          requestId: requestId,
        ));
      case Routes.comments:
        int requestId = routeSettings.arguments as int;

        return _materialRoute(
          CommentsScreen(requestId: requestId),
        );
      case Routes.albumImages:
        ImagesAlbum imagesAlbum = routeSettings.arguments as ImagesAlbum;
        ImageType imageType = routeSettings.arguments as ImageType;

        return _materialRoute(AlbumImageScreen(
          imagesAlbum: imagesAlbum,
          imageType: imageType,
        ));
      case Routes.qrScan:
        return _materialRoute(
          const QrCodeScanScreen(),
        );
      case Routes.notifications:
        return _materialRoute(
          const NotificationsScreen(),
        );
      case Routes.notificationDetails:
        Map<String, dynamic> arg =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(
          NotificationDetailsScreen(
              isPushedNotification: arg["isPushedNotification"] as bool,
              notificationDetails: arg["details"] as NotificationItem,
              notificationId: arg["id"] as int),
        );
      case Routes.changePassword:
        return _materialRoute(const ChangePasswordScreen());
      case Routes.fullVideoScreen:
        Map<String, dynamic> arg =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(
          FullVideoScreen(
            videoUrl: arg["videoUrl"] as String,
            isFromUrl: arg["isFromUrl"] as bool? ?? false,
          ),
        );
      case Routes.videoTrimmer:
        Map<String, dynamic> arg =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(
          VideoTrimmerScreen(
            file: arg["video"] as File,
            maxDuration: arg["maxDuration"] as int,
          ),
        );
      case Routes.playVideoScreen:
        Map<String, dynamic> arg =
            routeSettings.arguments as Map<String, dynamic>;
        return _materialRoute(
          PlayVideoScreen(
            video: arg["video"] as File,
            videoController:
                arg["videoPlayerController"] as VideoPlayerController,
          ),
        );
      case Routes.surveyScreen:
        return _materialRoute(
          const SurveyScreen(),
        );
      case Routes.cityEyeHomeScreen:
        return _materialRoute(
          const CityEyeHomeScreen(),
        );
      case Routes.mainCityEyeScreen:
        return _materialRoute(
          const MainCityEyeScreen(),
        );
      case Routes.cityEyeMoreScreen:
        return _materialRoute(
          const CityEyeMoreScreen(),
        );
      default:
        return _materialRoute(const SplashScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route<dynamic> unDefinedRoute(String name) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Not found")),
        body: Center(
          child: Text("$name"),
        ),
      ),
    );
  }
}
