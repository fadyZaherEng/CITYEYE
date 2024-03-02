import 'package:city_eye/src/data/sources/remote/api_key.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/city_eye_tech_response.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/city_eye_tech_request.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/change_password/request/change_password_request.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/language/remote_language.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/notifications/entity/remote_notification_item.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/notifications/request/notification_details_request.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/notifications/request/notification_seen_request.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/notifications/request/notifications_disable_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'more_api_service.g.dart';

@RestApi()
abstract class MoreAPIService {
  factory MoreAPIService(Dio dio) = _MoreAPIService;

  @POST(APIKeys.notifications)
  Future<HttpResponse<CityEyeTechResponse<List<RemoteNotificationItem>>>>
      getNotifications(@Body() CityEyeTechRequest request);

  @POST(APIKeys.notificationDetail)
  Future<HttpResponse<CityEyeTechResponse<RemoteNotificationItem>>> getNotificationById(
    @Body() CityEyeTechRequest<NotificationDetailsRequest> request,
  );

  @POST(APIKeys.disableNotifications)
  Future<HttpResponse<CityEyeTechResponse>> disableNotifications(
      @Body() CityEyeTechRequest<NotificationsDisableRequest> request,
      );

  @POST(APIKeys.resetPassword)
  Future<HttpResponse<CityEyeTechResponse>> resetPassword(
      @Body() CityEyeTechRequest<ChangePasswordRequest> request,
      );

  @POST(APIKeys.language)
  Future<HttpResponse<CityEyeTechResponse<List<RemoteLanguage>>>> getLanguage(
      @Body() CityEyeTechRequest request);

  @POST(APIKeys.updateNotificationAsSeen)
  Future<HttpResponse<CityEyeTechResponse>> updateNotificationAsSeen(
      @Body() CityEyeTechRequest<NotificationSeenRequest> request,
      );

}
