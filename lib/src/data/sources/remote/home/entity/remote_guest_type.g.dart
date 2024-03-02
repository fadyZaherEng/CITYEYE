// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_guest_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGuestType _$RemoteGuestTypeFromJson(Map<String, dynamic> json) =>
    RemoteGuestType(
      id: json['id'] as int? ?? 0,
      code: json['code'] as String? ?? "",
      name: json['name'] as String? ?? "",
    );

Map<String, dynamic> _$RemoteGuestTypeToJson(RemoteGuestType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
