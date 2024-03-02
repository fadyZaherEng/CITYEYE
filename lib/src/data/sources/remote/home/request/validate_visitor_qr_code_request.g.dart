// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_visitor_qr_code_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateVisitorQrCodeRequest _$ValidateVisitorQrCodeRequestFromJson(
        Map<String, dynamic> json) =>
    ValidateVisitorQrCodeRequest(
      pinCode: json['pinCode'] as int,
      encryptedQr: json['encryptedQr'] as String,
    );

Map<String, dynamic> _$ValidateVisitorQrCodeRequestToJson(
        ValidateVisitorQrCodeRequest instance) =>
    <String, dynamic>{
      'pinCode': instance.pinCode,
      'encryptedQr': instance.encryptedQr,
    };
