import 'dart:io';

import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/city_eye_tech_request.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/entity/remote_get_compound_all_user_status.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/entity/remote_get_compound_last5_day_cash_flow.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/entity/remote_get_compound_top_five.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/entity/remote_get_qr_number.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/entity/remote_get_qr_status.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/entity/remote_get_service_number.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/entity/remote_get_support_number.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/entity/remote_get_tech_support_status.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/request/get_qr_number_request.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/request/get_service_number_request.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/request/get_support_request.dart';
import 'package:city_eye/src/data/sources/remote/dashboard/tech_dashboard_api_service.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_compound_last_five_day_cash_flow.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_compound_status.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_qr_number.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_qr_status.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_service_number.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_support_number.dart';
import 'package:city_eye/src/domain/entities/dashboard/get_tech_support_status.dart';
import 'package:city_eye/src/domain/entities/dashboard/service_data.dart';
import 'package:city_eye/src/domain/repositories/dashboard_repository.dart';
import 'package:dio/dio.dart';

final class DashboardRepositoryIImplementation implements DashboardRepository {
  final DashboardApiService _techDashboardApiService;

  DashboardRepositoryIImplementation(this._techDashboardApiService);

  @override
  Future<DataState<GetQrNumber>> getQrNumber({
    required GetQrNumberRequest getQrNumber,
  }) async {
    try {
      final request = CityEyeTechRequest<GetQrNumberRequest>().createRequest(
        GetQrNumberRequest(
          fromDate: getQrNumber.fromDate,
          guestTypeId: getQrNumber.guestTypeId,
          qrStatusId: getQrNumber.qrStatusId,
          qrTypeId: getQrNumber.qrTypeId,
          toDate: getQrNumber.toDate,
        ),
      );
      final httpResponse = await _techDashboardApiService.getQrNumber(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess(
            data: (httpResponse.data.result?.mapToDomain()),
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
  Future<DataState<List<GetServiceNumber>>> getServiceNumber({
    required GetServiceNumberRequest getServiceNumber,
  }) async {
    try {
      final request =
          CityEyeTechRequest<GetServiceNumberRequest>().createRequest(
        GetServiceNumberRequest(
          toDate: getServiceNumber.toDate,
          fromDate: getServiceNumber.fromDate,
          categoryId: getServiceNumber.categoryId,
          serviceStatusId: getServiceNumber.serviceStatusId,
        ),
      );
      final httpResponse =
          await _techDashboardApiService.getServiceNumber(request);
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
        error: error,
        message: error.message,
      );
    }
  }

  @override
  Future<DataState<GetSupportNumber>> getSupportNumber({
    required GetSupportRequest getSupportNumber,
  }) async {
    try {
      final request = CityEyeTechRequest<GetSupportRequest>().createRequest(
        GetSupportRequest(
          fromDate: getSupportNumber.fromDate,
          toDate: getSupportNumber.toDate,
          supportStatusId: getSupportNumber.supportStatusId,
        ),
      );
      final httpResponse =
          await _techDashboardApiService.getSupportNumber(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess(
            data: (httpResponse.data.result?.mapToDomain()),
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
  Future<DataState<GetCompoundAllUserStatus>> getCompoundAllUserStatus() async {
    try {
      final request = CityEyeTechRequest().createRequest({});
      final httpResponse =
          await _techDashboardApiService.getCompoundAllUserStatus(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess(
            data: (httpResponse.data.result?.toDomain()),
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
  Future<DataState<List<ServiceData>>> getCompoundTopFive() async {
    try {
      final request = CityEyeTechRequest().createRequest({});
      final httpResponse =
          await _techDashboardApiService.getCompoundTopFive(request);
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
        error: error,
      );
    }
  }

  @override
  Future<DataState<List<GetTechSupportStatus>>> getTechSupportStatus() async {
    try {
      final request = CityEyeTechRequest().createRequest({});
      final httpResponse =
          await _techDashboardApiService.getTechSupportStatus(request);
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
        error: error,
        message: error.message,
      );
    }
  }

  @override
  Future<DataState<List<GetQrStatus>>> getQrStatus() async {
    try {
      final request = CityEyeTechRequest().createRequest({});
      final httpResponse = await _techDashboardApiService.getQrStatus(request);
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
        error: error,
        message: error.message,
      );
    }
  }

  @override
  Future<DataState<List<GetCompoundLast5DayCashFlow>>>
      getCompoundLast5DayCashFlow() async {
    try {
      final request = CityEyeTechRequest().createRequest({});
      final httpResponse =
          await _techDashboardApiService.getCompoundLast5DayCashFlow(request);
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
        error: error,
        message: error.message,
      );
    }
  }
}
