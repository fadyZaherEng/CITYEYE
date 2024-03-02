// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_compound_multimedia_type_configurations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteCompoundMultiMediaConfigrationDtos
    _$RemoteCompoundMultiMediaConfigrationDtosFromJson(
            Map<String, dynamic> json) =>
        RemoteCompoundMultiMediaConfigrationDtos(
          id: json['id'] as int?,
          isVisible: json['isVisible'] as bool?,
          minCount: json['minCount'] as int?,
          maxCount: json['maxCount'] as int?,
          maxTime: json['maxTime'] as int?,
          maxSize: json['maxSize'] as int?,
          isMulti: json['isMulti'] as bool?,
          multiMediaType: json['multiMediaType'] == null
              ? null
              : RemoteMultiMediaType.fromJson(
                  json['multiMediaType'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$RemoteCompoundMultiMediaConfigrationDtosToJson(
        RemoteCompoundMultiMediaConfigrationDtos instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isVisible': instance.isVisible,
      'minCount': instance.minCount,
      'maxCount': instance.maxCount,
      'maxTime': instance.maxTime,
      'maxSize': instance.maxSize,
      'isMulti': instance.isMulti,
      'multiMediaType': instance.multiMediaType,
    };
