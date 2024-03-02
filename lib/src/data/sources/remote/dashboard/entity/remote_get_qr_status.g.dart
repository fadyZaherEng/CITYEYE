// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_qr_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetQrStatus _$RemoteGetQrStatusFromJson(Map<String, dynamic> json) =>
    RemoteGetQrStatus(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      extraValue1: json['extraValue1'] as String?,
      extraValue2: json['extraValue2'] as String?,
      parentId: json['parentId'],
      logo: json['logo'] as String?,
      sortNo: json['sortNo'] as int?,
    );

Map<String, dynamic> _$RemoteGetQrStatusToJson(RemoteGetQrStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'extraValue1': instance.extraValue1,
      'extraValue2': instance.extraValue2,
      'parentId': instance.parentId,
      'logo': instance.logo,
      'sortNo': instance.sortNo,
    };
