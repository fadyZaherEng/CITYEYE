// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_eye_tech_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityEyeTechResponse<T> _$CityEyeTechResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    CityEyeTechResponse<T>(
      statusCode: json['statusCode'] as int?,
      requestId: json['requestId'] as String?,
      error:
          (json['error'] as List<dynamic>?)?.map((e) => e as String).toList(),
      success: json['success'] as bool?,
      responseMessage: json['responseMessage'] as String?,
      result: _$nullableGenericFromJson(json['result'], fromJsonT),
    );

Map<String, dynamic> _$CityEyeTechResponseToJson<T>(
  CityEyeTechResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'requestId': instance.requestId,
      'error': instance.error,
      'success': instance.success,
      'responseMessage': instance.responseMessage,
      'result': _$nullableGenericToJson(instance.result, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
