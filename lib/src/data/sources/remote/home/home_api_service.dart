import 'package:city_eye/src/data/sources/remote/api_key.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/city_eye_tech_request.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/city_eye_tech_response.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/city_eye/remote_get_compound_home_section.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/city_eye/remote_surveys.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/compound_configuration/remote_get_compound_configuration.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/events/model/remote_submit_event.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/get_offers/model/remote_get_offers.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/get_offers/request/get_offer_request.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/remote_notification_count.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/remote_qr_code_details.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/remote_user_attendance_information.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/remote_visitor.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_validate_visitor_qr_code_in.dart';
import 'package:city_eye/src/data/sources/remote/home/request/add_stuff_attendance_request.dart';
import 'package:city_eye/src/data/sources/remote/home/request/qr_code_details_request.dart';
import 'package:city_eye/src/data/sources/remote/home/request/validate_visitor_qr_code_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi()
abstract class HomeAPIService {
  factory HomeAPIService(Dio dio) = _HomeAPIService;

  @POST(APIKeys.getStuffAttendanceInformation)
  Future<HttpResponse<CityEyeTechResponse<RemoteUserAttendanceInformation>>>
      getStuffAttendanceInformation(@Body() CityEyeTechRequest request);

  @POST(APIKeys.addStuffAttendance)
  Future<HttpResponse<CityEyeTechResponse<RemoteUserAttendanceInformation>>>
      addStuffAttendance(
          @Body() CityEyeTechRequest<AddStuffAttendanceRequest> request);

  @POST(APIKeys.getVisitors)
  Future<HttpResponse<CityEyeTechResponse<List<RemoteVisitor>>>> getVisitors(
      @Body() CityEyeTechRequest request);

  @POST(APIKeys.getQrCodeDetails)
  Future<HttpResponse<CityEyeTechResponse<RemoteQrCodeDetails>>>
      getQrCodeDetails(
          @Body() CityEyeTechRequest<QrCodeDetailsRequest> request);

  @POST(APIKeys.validateVisitorQrCode)
  Future<HttpResponse<CityEyeTechResponse<RemoteValidateVisitorQrCodeIn>>>
      getValidateVisitorQrCode(
          @Body() CityEyeTechRequest<ValidateVisitorQrCodeRequest> request);

  @POST(APIKeys.getUserUnseenNotificationsCount)
  Future<HttpResponse<CityEyeTechResponse<RemoteNotificationCount>>>
      getUserUnseenNotificationsCount(@Body() CityEyeTechRequest request);

  @POST(APIKeys.getOffers)
  Future<HttpResponse<CityEyeTechResponse<List<RemoteGetOffers>>>> getOffers(
      @Body() CityEyeTechRequest<GetOfferRequest> request);

  @POST(APIKeys.getHomeSection)
  Future<HttpResponse<CityEyeTechResponse<RemoteGetCompoundHomeSection>>>
      getHomeSection(@Body() CityEyeTechRequest request);

  @POST(APIKeys.submitSurvey)
  @MultiPart()
  Future<HttpResponse<CityEyeTechResponse<RemoteSurveys>>> submitSurvey(
    @Part(name: 'requestHeader') String requestHeader,
    @Part(name: "Files") List<MultipartFile> files,
  );

  @POST(APIKeys.getSurveyList)
  Future<HttpResponse<CityEyeTechResponse<List<RemoteSurveys>>>> getSurveyList(
    @Body() CityEyeTechRequest request,
  );
  @POST(APIKeys.submitEventTransaction)
  @MultiPart()
  Future<HttpResponse<CityEyeTechResponse<RemoteSubmitEvent>>> submitEvent(
    @Part(name: 'requestHeader') String requestHeader,
    @Part(name: "Files") List<MultipartFile> files,
  );
  @POST(APIKeys.getCompoundConfigration)
  Future<HttpResponse<CityEyeTechResponse<RemoteGetCompoundConfiguration>>>
      getCompoundConfigration(
    @Body() CityEyeTechRequest request,
  );
}
