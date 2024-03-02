// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_qr_code_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteQrCodeDetails _$RemoteQrCodeDetailsFromJson(Map<String, dynamic> json) =>
    RemoteQrCodeDetails(
      isValid: json['isValid'] as bool?,
      unitsQRCodeScanned: json['qrCodeDetails'] == null
          ? null
          : RemoteUnitsQRCodeScanned.fromJson(
              json['qrCodeDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteQrCodeDetailsToJson(
        RemoteQrCodeDetails instance) =>
    <String, dynamic>{
      'isValid': instance.isValid,
      'qrCodeDetails': instance.unitsQRCodeScanned?.toJson(),
    };
