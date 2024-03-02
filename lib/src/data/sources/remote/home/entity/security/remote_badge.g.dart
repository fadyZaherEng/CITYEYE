// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_badge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteBadge _$RemoteBadgeFromJson(Map<String, dynamic> json) => RemoteBadge(
      id: json['id'] as int?,
      qrImage: json['qrImage'] as String?,
      pinCode: json['pinCode'] as int?,
      expiredDate: json['expiredDate'] as String?,
      compoundUnits: json['compoundUnits'] == null
          ? null
          : RemoteCompoundUnits.fromJson(
              json['compoundUnits'] as Map<String, dynamic>),
      qrCodeStatus: json['qrCodeStatus'] == null
          ? null
          : RemoteQrCodeStatus.fromJson(
              json['qrCodeStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteBadgeToJson(RemoteBadge instance) =>
    <String, dynamic>{
      'id': instance.id,
      'qrImage': instance.qrImage,
      'pinCode': instance.pinCode,
      'expiredDate': instance.expiredDate,
      'compoundUnits': instance.compoundUnits,
      'qrCodeStatus': instance.qrCodeStatus,
    };
