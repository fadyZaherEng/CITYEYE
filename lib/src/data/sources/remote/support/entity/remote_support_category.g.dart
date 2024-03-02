// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_support_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteSupportCategory _$RemoteSupportCategoryFromJson(
        Map<String, dynamic> json) =>
    RemoteSupportCategory(
      id: json['id'] as int? ?? 0,
      code: json['code'] as String? ?? "",
      name: json['name'] as String? ?? "",
      logo: json['logo'] as String? ?? "",
    );

Map<String, dynamic> _$RemoteSupportCategoryToJson(
        RemoteSupportCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'logo': instance.logo,
    };
