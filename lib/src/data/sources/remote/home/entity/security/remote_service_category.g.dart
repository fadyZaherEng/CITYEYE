// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_service_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteServiceCategory _$RemoteServiceCategoryFromJson(
        Map<String, dynamic> json) =>
    RemoteServiceCategory(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      logo: json['logo'] as String?,
      parent: json['parent'] == null
          ? null
          : RemoteParent.fromJson(json['parent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteServiceCategoryToJson(
        RemoteServiceCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'logo': instance.logo,
      'parent': instance.parent,
    };
