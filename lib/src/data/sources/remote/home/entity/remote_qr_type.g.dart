// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_qr_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteQrType _$RemoteQrTypeFromJson(Map<String, dynamic> json) => RemoteQrType(
      id: json['id'] as int? ?? 0,
      code: json['code'] as String? ?? "",
      name: json['name'] as String? ?? "",
    );

Map<String, dynamic> _$RemoteQrTypeToJson(RemoteQrType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
    };
