import 'dart:convert';
import 'dart:io';

import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/city_eye_tech_request.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/city_eye/remote_get_compound_home_section.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/city_eye/remote_surveys.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/compound_configuration/remote_get_compound_configuration.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/events/model/remote_submit_event.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/events/request/submit_event_request.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/get_offers/model/remote_get_offers.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/get_offers/request/get_offer_request.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/remote_notification_count.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/remote_qr_code_details.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/remote_user_attendance_information.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/remote_visitor.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_validate_visitor_qr_code_in.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/survey/request/submit_survey_request.dart';
import 'package:city_eye/src/data/sources/remote/home/home_api_service.dart';
import 'package:city_eye/src/data/sources/remote/home/request/add_stuff_attendance_request.dart';
import 'package:city_eye/src/data/sources/remote/home/request/qr_code_details_request.dart';
import 'package:city_eye/src/data/sources/remote/home/request/validate_visitor_qr_code_request.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/get_compound_configuration.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/get_compound_home_section.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/get_offers.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/submit_event.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/survey.dart';
import 'package:city_eye/src/domain/entities/home/notification_count.dart';
import 'package:city_eye/src/domain/entities/home/qr_code_details.dart';
import 'package:city_eye/src/domain/entities/home/security/validate_visitor_qr_code_in.dart';
import 'package:city_eye/src/domain/entities/home/stuff_attendance_information.dart';
import 'package:city_eye/src/domain/entities/home/visitor.dart';
import 'package:city_eye/src/domain/repositories/home_repository.dart';
import 'package:dio/dio.dart';

final class HomeRepositoryImplementation implements HomeRepository {
  final HomeAPIService _homeAPIService;

  HomeRepositoryImplementation(this._homeAPIService);

  @override
  Future<DataState<UserAttendanceInformation>>
      getStuffAttendanceInformation() async {
    try {
      final request = CityEyeTechRequest().createRequest(null);
      final httpResponse =
          await _homeAPIService.getStuffAttendanceInformation(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess(
            data: (httpResponse.data.result ??
                    const RemoteUserAttendanceInformation())
                .mapToDomain(),
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

  @override
  Future<DataState<UserAttendanceInformation>> addStuffAttendance(
      AddStuffAttendanceRequest addStuffAttendanceRequest) async {
    try {
      final request = CityEyeTechRequest<AddStuffAttendanceRequest>()
          .createRequest(addStuffAttendanceRequest);
      final httpResponse = await _homeAPIService.addStuffAttendance(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess(
            data: (httpResponse.data.result ??
                    const RemoteUserAttendanceInformation())
                .mapToDomain(),
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
    } catch (_) {
      return DataFailed(message: 'Failed');
    }
  }

  @override
  Future<DataState<List<Visitor>>> getVisitors() async {
    try {
      final request = CityEyeTechRequest().createRequest(null);
      final httpResponse = await _homeAPIService.getVisitors(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess(
            data: (httpResponse.data.result ?? const []).mapToDomain(),
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

  @override
  Future<DataState<QrCodeDetails>> getQrCodeDetails(
      QrCodeDetailsRequest qrCodeDetailsRequest) async {
    try {
      final request = CityEyeTechRequest<QrCodeDetailsRequest>()
          .createRequest(qrCodeDetailsRequest);
      final httpResponse = await _homeAPIService.getQrCodeDetails(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess(
            data: (httpResponse.data.result ?? const RemoteQrCodeDetails())
                .mapToDomain(),
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

  @override
  Future<DataState<ValidateVisitorQrCodeIn>> getValidateVisitorQrCode(
      ValidateVisitorQrCodeRequest validateVisitorQrCodeRequest) async {
    try {
      final request = CityEyeTechRequest<ValidateVisitorQrCodeRequest>()
          .createRequest(validateVisitorQrCodeRequest);
      final httpResponse =
          await _homeAPIService.getValidateVisitorQrCode(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess(
            data: (httpResponse.data.result ??
                    const RemoteValidateVisitorQrCodeIn())
                .mapToDomain(),
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

  @override
  Future<DataState<NotificationCount>> getUserUnseenNotificationsCount() async {
    try {
      final request = CityEyeTechRequest().createRequest(null);
      final httpResponse =
          await _homeAPIService.getUserUnseenNotificationsCount(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess<NotificationCount>(
            message: httpResponse.data.responseMessage ?? "",
            data: (httpResponse.data.result ?? const RemoteNotificationCount())
                .mapToDomain(),
          );
        }
      }
      return DataFailed(message: httpResponse.data.responseMessage ?? "");
    } on DioException catch (error) {
      return DataFailed(
        message: error.message ?? "",
        error: error,
      );
    }
  }

  @override
  Future<DataState<GetCompoundHomeSection>> getHomeSection() async {
    try {
      final request = CityEyeTechRequest().createRequest({});
      final httpResponse = await _homeAPIService.getHomeSection(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess<GetCompoundHomeSection>(
            message: httpResponse.data.responseMessage ?? "",
            data: (httpResponse.data.result ??
                    const RemoteGetCompoundHomeSection())
                .mapToDomain(),
          );
        }
      }
      return DataFailed(message: httpResponse.data.responseMessage ?? "");
    } on DioException catch (error) {
      return DataFailed(
        message: error.message ?? "",
        error: error,
      );
    }
  }

  @override
  Future<DataState<List<GetOffers>>> getOffers({
    required GetOfferRequest getOfferRequest,
  }) async {
    try {
      final request = CityEyeTechRequest<GetOfferRequest>().createRequest(
        getOfferRequest,
      );
      final httpResponse = await _homeAPIService.getOffers(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess(
            data: (httpResponse.data.result ?? []).mapToDomain(),
            message: httpResponse.data.responseMessage ?? "",
          );
        }
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (error) {
      return DataFailed(
        message: error.message,
        error: error,
      );
    }
  }

  @override
  Future<DataState<List<Surveys>>> getSurveyList() async {
    try {
      final request = CityEyeTechRequest().createRequest({});
      final httpResponse = await _homeAPIService.getSurveyList(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess(
            data: (httpResponse.data.result ?? []).toDomain(),
            message: httpResponse.data.responseMessage ?? "",
          );
        }
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (error) {
      return DataFailed(
        message: error.message,
        error: error,
      );
    }
  }

  @override
  Future<DataState<Surveys>> submitSurvey(
      {String? file, required SubmitSurveyRequest submitSurveyRequest}) async {
    try {
      final request = CityEyeTechRequest<SubmitSurveyRequest>().createRequest(
        submitSurveyRequest,
      );
      List<MultipartFile> files = [];

      final httpResponse = await _homeAPIService.submitSurvey(
          jsonEncode(request.toMap()), files);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess(
            data: httpResponse.data.result.mapToDomain(),
            message: httpResponse.data.responseMessage ?? "",
          );
        }
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (error) {
      return DataFailed(
        message: error.message,
        error: error,
      );
    }
  }

  @override
  Future<DataState<SubmitEvent>> submitEvent({
    Map<String, File>? file,
    required SubmitEventRequest submitEventRequest,
  }) async {
    try {
      final request = CityEyeTechRequest<SubmitEventRequest>().createRequest(
        submitEventRequest,
      );
      List<MultipartFile> multipartFiles = [];
      file?.entries.forEach((element) async {
        multipartFiles.add(
          await MultipartFile.fromFile(element.value.path,
              filename: element.key),
        );
      });
      final httpResponse = await _homeAPIService.submitEvent(
          jsonEncode(request.toMap()), multipartFiles);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess(
            data: httpResponse.data.result?.toDomain(),
            message: httpResponse.data.responseMessage ?? "",
          );
        }
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } on DioException catch (error) {
      return DataFailed(
        message: error.message,
      );
    }
  }

  @override
  Future<DataState<GetCompoundConfiguration>> getCompoundConfiguration() async {
    try {
      final request = CityEyeTechRequest().createRequest({});
      final httpResponse =
          await _homeAPIService.getCompoundConfigration(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess(
            data: httpResponse.data.result?.toDomain(),
            message: httpResponse.data.responseMessage ?? "",
          );
        }
      }
      return DataFailed(
        message: httpResponse.data.responseMessage ?? "",
      );
    } catch (error) {
      return DataFailed(
        message: error.toString(),
      );
    }
  }
}
