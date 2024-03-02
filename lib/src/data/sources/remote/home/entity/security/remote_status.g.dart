// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteStatus _$RemoteStatusFromJson(Map<String, dynamic> json) => RemoteStatus(
      id: json['id'] as int?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$RemoteStatusToJson(RemoteStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'color': instance.color,
    };
