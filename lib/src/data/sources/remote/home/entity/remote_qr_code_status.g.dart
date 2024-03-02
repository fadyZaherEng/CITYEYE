// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_qr_code_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteQrCodeStatus _$RemoteQrCodeStatusFromJson(Map<String, dynamic> json) =>
    RemoteQrCodeStatus(
      id: json['id'] as int? ?? 0,
      code: json['code'] as String? ?? "",
      name: json['name'] as String? ?? "",
      color: json['color'] as String? ?? "",
    );

Map<String, dynamic> _$RemoteQrCodeStatusToJson(RemoteQrCodeStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'color': instance.color,
    };
