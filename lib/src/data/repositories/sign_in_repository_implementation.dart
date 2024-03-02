import 'dart:io';

import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/city_eye_tech_request.dart';
import 'package:city_eye/src/data/sources/remote/sign-in/entity/remote_login.dart';
import 'package:city_eye/src/data/sources/remote/sign-in/entity/remote_user.dart';
import 'package:city_eye/src/data/sources/remote/sign-in/request/forgot_password_request.dart';
import 'package:city_eye/src/data/sources/remote/sign-in/request/sign_in_request.dart';
import 'package:city_eye/src/data/sources/remote/sign-in/sign_in_api_service.dart';
import 'package:city_eye/src/domain/entities/sign_in/log_in.dart';
import 'package:city_eye/src/domain/entities/sign_in/user.dart';
import 'package:city_eye/src/domain/repositories/sign_in_repository.dart';
import 'package:dio/dio.dart';

final class SignInRepositoryImplementation implements SignInRepository {
  final SignInAPIService _signInAPIService;

  SignInRepositoryImplementation(this._signInAPIService);

  @override
  Future<DataState<User>> signIn(SignInRequest signInRequest) async {
    try {
      final CityEyeTechRequest<SignInRequest> request =
          CityEyeTechRequest<SignInRequest>().createRequest(signInRequest);
      final httpResponse = await _signInAPIService.signIn(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess(
            data:
                (httpResponse.data.result ?? const RemoteUser()).mapToDomain(),
            message: httpResponse.data.responseMessage ?? "",
          );
        }
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (error) {
      return DataFailed(
        error: error,
        message: error.message,
      );
    } catch (error) {
      return DataFailed(
        message: 'Failed',
      );
    }
  }

  @override
  Future<DataState> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest) async {
    try {
      final CityEyeTechRequest<ForgotPasswordRequest> request =
          CityEyeTechRequest<ForgotPasswordRequest>()
              .createRequest(forgotPasswordRequest);
      final httpResponse = await _signInAPIService.forgotPassword(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess(
            message: httpResponse.data.responseMessage ?? "",
          );
        }
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (error) {
      return DataFailed(
        error: error,
        message: error.message,
      );
    } catch (error) {
      return DataFailed(
        message: 'Failed',
      );
    }
  }

  @override
  Future<DataState<Login>> cityEyeLogin(SignInRequest signInRequest) async {
    try {
      final CityEyeTechRequest<SignInRequest> request =
          CityEyeTechRequest<SignInRequest>().createRequest(signInRequest);
      final httpResponse = await _signInAPIService.cityEyeLogin(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess(
            data:
                (httpResponse.data.result ?? const RemoteLogin()).mapToDomain(),
            message: httpResponse.data.responseMessage ?? "",
          );
        }
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (error) {
      return DataFailed(
        error: error,
        message: error.message,
      );
    }
  }
}
