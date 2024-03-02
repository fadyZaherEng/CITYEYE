import 'dart:io';

import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/city_eye_tech_request.dart';
import 'package:city_eye/src/data/sources/remote/lock_up_data/entity/remote_get_lock_up_rows.dart';
import 'package:city_eye/src/data/sources/remote/lock_up_data/lock_up_data_api_service.dart';
import 'package:city_eye/src/data/sources/remote/lock_up_data/request/get_lock_up_data_rows_request.dart';
import 'package:city_eye/src/domain/entities/lock_up_data/get_lock_up_data_rows.dart';
import 'package:city_eye/src/domain/repositories/lock_up_data_repository.dart';
import 'package:dio/dio.dart';

class LockUpDataRepositoryImplementation implements LockUpDataRepository {
  final LockUpDataApiService _lockUpDataApiService;

  LockUpDataRepositoryImplementation(this._lockUpDataApiService);

  @override
  Future<DataState<List<GetLockUpRows>>> getLockUpRows({
    required List<GetLockUpDataRowsRequest> getLockUpDataRowsRequest,
  }) async {
    try {
      final request =
          CityEyeTechRequest<List<GetLockUpDataRowsRequest>>().createRequest(
        getLockUpDataRowsRequest,
      );
      final httpResponse = await _lockUpDataApiService.getLockUpRows(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess(
            data: (httpResponse.data.result ?? const []).mapToDomain(),
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
