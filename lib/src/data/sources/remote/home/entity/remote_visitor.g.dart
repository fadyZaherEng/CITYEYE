// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_visitor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteVisitor _$RemoteVisitorFromJson(Map<String, dynamic> json) =>
    RemoteVisitor(
      id: json['id'] as int? ?? 0,
      validFromDate: json['validFromDate'] as String? ?? "",
      validToDate: json['validToDate'] as String? ?? "",
      pinCode: json['pinCode'] as int? ?? 0,
      guestName: json['guestName'] as String? ?? "",
      fromTime: json['fromTime'] as String? ?? "",
      toTime: json['toTime'] as String? ?? "",
      ownerName: json['ownerName'] as String? ?? "",
      guestType: json['guestType'] == null
          ? const RemoteGuestType()
          : RemoteGuestType.fromJson(json['guestType'] as Map<String, dynamic>),
      qrCodeStatus: json['qrCodeStatus'] == null
          ? const RemoteQrCodeStatus()
          : RemoteQrCodeStatus.fromJson(
              json['qrCodeStatus'] as Map<String, dynamic>),
      qrType: json['qrType'] == null
          ? const RemoteQrType()
          : RemoteQrType.fromJson(json['qrType'] as Map<String, dynamic>),
      userUnits: json['userUnits'] == null
          ? const RemoteUserUnits()
          : RemoteUserUnits.fromJson(json['userUnits'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteVisitorToJson(RemoteVisitor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'validFromDate': instance.validFromDate,
      'validToDate': instance.validToDate,
      'pinCode': instance.pinCode,
      'guestName': instance.guestName,
      'fromTime': instance.fromTime,
      'toTime': instance.toTime,
      'ownerName': instance.ownerName,
      'guestType': instance.guestType?.toJson(),
      'qrCodeStatus': instance.qrCodeStatus?.toJson(),
      'qrType': instance.qrType?.toJson(),
      'userUnits': instance.userUnits?.toJson(),
    };
