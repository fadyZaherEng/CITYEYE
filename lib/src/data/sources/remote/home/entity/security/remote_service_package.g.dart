// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_service_package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteServicePackages _$RemoteServicePackagesFromJson(
        Map<String, dynamic> json) =>
    RemoteServicePackages(
      id: json['id'] as int?,
      name: json['name'] as String?,
      isCountType: json['isCountType'] as bool?,
      serviceCategory: json['serviceCategory'] == null
          ? null
          : RemoteServiceCategory.fromJson(
              json['serviceCategory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteServicePackagesToJson(
        RemoteServicePackages instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isCountType': instance.isCountType,
      'serviceCategory': instance.serviceCategory,
    };
