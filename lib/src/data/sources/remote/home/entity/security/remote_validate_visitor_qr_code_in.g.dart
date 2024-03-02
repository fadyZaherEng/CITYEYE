// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_validate_visitor_qr_code_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteValidateVisitorQrCodeIn _$RemoteValidateVisitorQrCodeInFromJson(
        Map<String, dynamic> json) =>
    RemoteValidateVisitorQrCodeIn(
      sorceKey: json['sorceKey'] as int?,
      isValid: json['isValid'] as bool?,
      userUnitInfo: json['userUnitInfo'] == null
          ? null
          : RemoteUserUnitInfo.fromJson(
              json['userUnitInfo'] as Map<String, dynamic>),
      badgeScanned: json['badgeScanned'] == null
          ? null
          : RemoteBadgeScanned.fromJson(
              json['badgeScanned'] as Map<String, dynamic>),
      serviceScanned: json['serviceScanned'] == null
          ? null
          : RemoteServiceScanned.fromJson(
              json['serviceScanned'] as Map<String, dynamic>),
      delegationScanned: json['delegationScanned'] == null
          ? null
          : RemoteDelegationScanned.fromJson(
              json['delegationScanned'] as Map<String, dynamic>),
      unitsQRCodeScanned: json['unitsQRCodeScanned'] == null
          ? null
          : RemoteUnitsQRCodeScanned.fromJson(
              json['unitsQRCodeScanned'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteValidateVisitorQrCodeInToJson(
        RemoteValidateVisitorQrCodeIn instance) =>
    <String, dynamic>{
      'sorceKey': instance.sorceKey,
      'isValid': instance.isValid,
      'userUnitInfo': instance.userUnitInfo,
      'badgeScanned': instance.badgeScanned,
      'serviceScanned': instance.serviceScanned,
      'delegationScanned': instance.delegationScanned,
      'unitsQRCodeScanned': instance.unitsQRCodeScanned,
    };
