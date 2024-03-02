// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_compound_top_five.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteServiceData _$RemoteServiceDataFromJson(Map<String, dynamic> json) =>
    RemoteServiceData(
      serviceCategory: json['serviceCategory'] == null
          ? null
          : RemoteServiceCategory.fromJson(
              json['serviceCategory'] as Map<String, dynamic>),
      countOfUsers: json['countOfUsers'] as int?,
    );

Map<String, dynamic> _$RemoteServiceDataToJson(RemoteServiceData instance) =>
    <String, dynamic>{
      'serviceCategory': instance.serviceCategory,
      'countOfUsers': instance.countOfUsers,
    };

RemoteServiceCategory _$RemoteServiceCategoryFromJson(
        Map<String, dynamic> json) =>
    RemoteServiceCategory(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$RemoteServiceCategoryToJson(
        RemoteServiceCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'logo': instance.logo,
    };
