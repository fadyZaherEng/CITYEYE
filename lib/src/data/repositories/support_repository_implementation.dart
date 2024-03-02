import 'dart:convert';
import 'dart:io';

import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/city_eye_tech_request.dart';
import 'package:city_eye/src/data/sources/remote/support/entity/remote_support.dart';
import 'package:city_eye/src/data/sources/remote/support/entity/remote_support_comment.dart';
import 'package:city_eye/src/data/sources/remote/support/request/add_support_comment_request.dart';
import 'package:city_eye/src/data/sources/remote/support/request/change_support_request.dart';
import 'package:city_eye/src/data/sources/remote/support/request/get_support_comments_request.dart';
import 'package:city_eye/src/data/sources/remote/support/request/support_details_request.dart';
import 'package:city_eye/src/data/sources/remote/support/support_api_service.dart';
import 'package:city_eye/src/domain/entities/support/media.dart';
import 'package:city_eye/src/domain/entities/support/support.dart';
import 'package:city_eye/src/domain/entities/support/support_comment.dart';
import 'package:city_eye/src/domain/repositories/support_repository.dart';
import 'package:dio/dio.dart';

final class SupportRepositoryImplementation implements SupportRepository {
  final SupportAPIService _supportAPIService;

  SupportRepositoryImplementation(this._supportAPIService);

  @override
  Future<DataState<Support>> getSupportDetails(
      SupportDetailsRequest supportDetailsRequest) async {
    try {
      final request = CityEyeTechRequest<SupportDetailsRequest>()
          .createRequest(supportDetailsRequest);
      final httpResponse = await _supportAPIService.getSupportDetails(request);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if ((httpResponse.data.success ?? false) &&
            (httpResponse.data.statusCode ?? 400) == 200) {
          return DataSuccess(
            data: (httpResponse.data.result ?? const RemoteSupport())
                .mapToDomain(),
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
  Future<DataState<List<Support>>> getSupports() async {
    try {
      final request = CityEyeTechRequest().createRequest(null);
      final httpResponse = await _supportAPIService.getSupports(request);
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
  Future<DataState<List<SupportComment>>> getSupportComments(
      GetSupportCommentsRequest getSupportCommentsRequest) async {
    try {
      final request = CityEyeTechRequest<GetSupportCommentsRequest>()
          .createRequest(getSupportCommentsRequest);
      final httpResponse = await _supportAPIService.getSupportComments(request);
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
  Future<DataState<List<SupportComment>>> addSupportComment(
      AddSupportCommentRequest addSupportCommentRequest, String image) async {
    try {
      final request = CityEyeTechRequest<AddSupportCommentRequest>()
          .createRequest(addSupportCommentRequest);
      List<MultipartFile> images = [];
      if (addSupportCommentRequest.isImage == true) {
        images.add(
          await MultipartFile.fromFile(image,
              filename: 'image.${image.split('.').last}'),
        );
      }
      final httpResponse = await _supportAPIService.addSupportComment(
        jsonEncode(request.toMap()),
        images,
      );
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
  Future<DataState<Support>> changeSupportStatus({
    required ChangeSupportRequest changeSupportRequest,
    required List<MediaModel> files,
  }) async {
    try {
      final request = CityEyeTechRequest<ChangeSupportRequest>()
          .createRequest(changeSupportRequest);
      List<MultipartFile> multipartFiles = [];
      for (final file in files) {
        if (file.name == "video.") {
          multipartFiles.add(
            await MultipartFile.fromFile(file.path,
                filename: 'video.${file.path.split('.').last}'),
          );
        } else if (file.name == "audio.") {
          multipartFiles.add(
            await MultipartFile.fromFile(file.path,
                filename: 'audio.${file.path.split('.').last}'),
          );
        } else if (file.name == "image.") {
          multipartFiles.add(
            await MultipartFile.fromFile(file.path,
                filename: 'image.${file.path.split('.').last}'),
          );
        }
      }
      final httpResponse = await _supportAPIService.changeSupportStatus(
        jsonEncode(request.toMap()),
        multipartFiles,
      );
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
        error: error,
        message: error.message,
      );
    }
  }
}
