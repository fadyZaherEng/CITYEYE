import 'package:city_eye/src/data/sources/remote/api_key.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/city_eye_tech_request.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/city_eye_tech_response.dart';
import 'package:city_eye/src/data/sources/remote/support/entity/remote_support.dart';
import 'package:city_eye/src/data/sources/remote/support/entity/remote_support_comment.dart';
import 'package:city_eye/src/data/sources/remote/support/request/change_support_request.dart';
import 'package:city_eye/src/data/sources/remote/support/request/get_support_comments_request.dart';
import 'package:city_eye/src/data/sources/remote/support/request/support_details_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'support_api_service.g.dart';

@RestApi()
abstract class SupportAPIService {
  factory SupportAPIService(Dio dio) = _SupportAPIService;

  @POST(APIKeys.getSupportRequestList)
  Future<HttpResponse<CityEyeTechResponse<List<RemoteSupport>>>> getSupports(
      @Body() CityEyeTechRequest request);

  @POST(APIKeys.getSupportRequestDetails)
  Future<HttpResponse<CityEyeTechResponse<RemoteSupport>>> getSupportDetails(
      @Body() CityEyeTechRequest<SupportDetailsRequest> request);

  @POST(APIKeys.changeSupportRequestStatus)
  Future<HttpResponse<CityEyeTechResponse<RemoteSupport>>> changeSupport(
      @Body() CityEyeTechRequest<ChangeSupportRequest> request);

  @POST(APIKeys.getSupportComments)
  Future<HttpResponse<CityEyeTechResponse<List<RemoteSupportComment>>>>
      getSupportComments(
          @Body() CityEyeTechRequest<GetSupportCommentsRequest> request);

  @POST(APIKeys.addSupportComment)
  @MultiPart()
  Future<HttpResponse<CityEyeTechResponse<List<RemoteSupportComment>>>>
      addSupportComment(
    @Part(name: 'requestHeader') String requestHeader,
    @Part(name: "image") List<MultipartFile> files,
  );
  @POST(APIKeys.changeSupportRequestStatus)
  @MultiPart()
  Future<HttpResponse<CityEyeTechResponse<RemoteSupport>>> changeSupportStatus(
    @Part(name: 'requestHeader') String requestHeader,
    @Part(name: "files") List<MultipartFile> files,
  );
}
