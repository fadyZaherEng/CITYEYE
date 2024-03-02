import 'package:city_eye/src/data/sources/remote/api_key.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/city_eye_tech_request.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/city_eye_tech_response.dart';
import 'package:city_eye/src/data/sources/remote/sign-in/entity/remote_login.dart';
import 'package:city_eye/src/data/sources/remote/sign-in/entity/remote_user.dart';
import 'package:city_eye/src/data/sources/remote/sign-in/request/forgot_password_request.dart';
import 'package:city_eye/src/data/sources/remote/sign-in/request/sign_in_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_in_api_service.g.dart';

@RestApi()
abstract class SignInAPIService {
  factory SignInAPIService(Dio dio) = _SignInAPIService;

  @POST(APIKeys.signIn)
  Future<HttpResponse<CityEyeTechResponse<RemoteUser>>> signIn(
      @Body() CityEyeTechRequest<SignInRequest> signInRequest);

  @POST(APIKeys.cityEyeLogin)
  Future<HttpResponse<CityEyeTechResponse<RemoteLogin>>> cityEyeLogin(
      @Body() CityEyeTechRequest<SignInRequest> signInRequest);

  @POST(APIKeys.forgotPassword)
  Future<HttpResponse<CityEyeTechResponse>> forgotPassword(
      @Body() CityEyeTechRequest<ForgotPasswordRequest> forgotPasswordRequest);
}
