// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_service_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetServiceNumber _$RemoteGetServiceNumberFromJson(
        Map<String, dynamic> json) =>
    RemoteGetServiceNumber(
      categoryId: json['categoryId'] as int?,
      categoryName: json['categoryName'] as String?,
      categorySubscripersCount: json['categorySubscripersCount'] as int?,
    );

Map<String, dynamic> _$RemoteGetServiceNumberToJson(
        RemoteGetServiceNumber instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'categorySubscripersCount': instance.categorySubscripersCount,
    };
