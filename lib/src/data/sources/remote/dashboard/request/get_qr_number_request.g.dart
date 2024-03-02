// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_qr_number_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetQrNumberRequest _$GetQrNumberRequestFromJson(Map<String, dynamic> json) =>
    GetQrNumberRequest(
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      guestTypeId: json['guestTypeId'] as int?,
      qrTypeId: json['qrTypeId'] as int?,
      qrStatusId: json['qrStatusId'] as int?,
    );

Map<String, dynamic> _$GetQrNumberRequestToJson(GetQrNumberRequest instance) =>
    <String, dynamic>{
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'guestTypeId': instance.guestTypeId,
      'qrTypeId': instance.qrTypeId,
      'qrStatusId': instance.qrStatusId,
    };
