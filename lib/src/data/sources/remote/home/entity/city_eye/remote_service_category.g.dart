// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_service_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteServicesCategorys _$RemoteServicesCategorysFromJson(
        Map<String, dynamic> json) =>
    RemoteServicesCategorys(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "",
      code: json['code'] as String? ?? "",
      logo: json['logo'] as String? ?? "",
      sortNo: json['sortNo'] as int? ?? 0,
    );

Map<String, dynamic> _$RemoteServicesCategorysToJson(
        RemoteServicesCategorys instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'logo': instance.logo,
      'sortNo': instance.sortNo,
    };
