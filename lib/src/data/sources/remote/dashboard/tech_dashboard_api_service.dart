import 'package:city_eye/src/data/sources/remote/api_key.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/city_eye_tech_request.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/city_eye_tech_response.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/entity/remote_get_compound_all_user_status.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/entity/remote_get_compound_last5_day_cash_flow.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/entity/remote_get_compound_top_five.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/entity/remote_get_qr_number.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/entity/remote_get_qr_status.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/entity/remote_get_service_number.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/entity/remote_get_support_number.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/entity/remote_get_tech_support_status.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_compound_last_five_day_cash_flow.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'tech_dashboard_api_service.g.dart';

@RestApi()
abstract class DashboardApiService {
  factory DashboardApiService(Dio dio) = _DashboardApiService;

  @POST(APIKeys.getQrNumbers)
  Future<HttpResponse<CityEyeTechResponse<RemoteGetQrNumber>>> getQrNumber(
      @Body() CityEyeTechRequest request);
  @POST(APIKeys.getServiceRequestNumbers)
  Future<HttpResponse<CityEyeTechResponse<List<RemoteGetServiceNumber>>>>
      getServiceNumber(@Body() CityEyeTechRequest request);

  @POST(APIKeys.getSupportRequestNumbers)
  Future<HttpResponse<CityEyeTechResponse<RemoteGetSupportNumber>>>
      getSupportNumber(@Body() CityEyeTechRequest request);
  @POST(APIKeys.getCoumpondAllUsersStatus)
  Future<HttpResponse<CityEyeTechResponse<RemoteGetCompoundAllUserStatus>>>
      getCompoundAllUserStatus(@Body() CityEyeTechRequest request);
  @POST(APIKeys.getCoumpondTopFiveServices)
  Future<HttpResponse<CityEyeTechResponse<List<RemoteServiceData>>>>
      getCompoundTopFive(@Body() CityEyeTechRequest request);
  @POST(APIKeys.getTechSupportStatus)
  Future<HttpResponse<CityEyeTechResponse<List<RemoteGetTechSupportStatus>>>>
      getTechSupportStatus(@Body() CityEyeTechRequest request);
  @POST(APIKeys.getQrStatus)
  Future<HttpResponse<CityEyeTechResponse<List<RemoteGetQrStatus>>>>
      getQrStatus(@Body() CityEyeTechRequest request);
  @POST(APIKeys.getCoumpondLast5DaysCashFlow)
  Future<
          HttpResponse<
              CityEyeTechResponse<List<RemoteGetCompoundLast5DayCashFlow>>>>
      getCompoundLast5DayCashFlow(@Body() CityEyeTechRequest request);
}
