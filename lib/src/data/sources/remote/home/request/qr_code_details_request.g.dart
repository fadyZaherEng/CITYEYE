// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_details_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrCodeDetailsRequest _$QrCodeDetailsRequestFromJson(
        Map<String, dynamic> json) =>
    QrCodeDetailsRequest(
      qrId: json['qrId'] as int,
      pinCode: json['pinCode'] as int,
    );

Map<String, dynamic> _$QrCodeDetailsRequestToJson(
        QrCodeDetailsRequest instance) =>
    <String, dynamic>{
      'qrId': instance.qrId,
      'pinCode': instance.pinCode,
    };
