// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_qr_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetQrNumber _$RemoteGetQrNumberFromJson(Map<String, dynamic> json) =>
    RemoteGetQrNumber(
      allQrNumber: json['allQrNumber'] as int?,
      cancelledQrNumber: json['cancelledQrNumber'] as int?,
      completedQrNumber: json['completedQrNumber'] as int?,
      pendingQrNumber: json['pendingQrNumber'] as int?,
      holdQrNumber: json['holdQrNumber'] as int?,
      scannedQrNumber: json['scannedQrNumber'] as int?,
    );

Map<String, dynamic> _$RemoteGetQrNumberToJson(RemoteGetQrNumber instance) =>
    <String, dynamic>{
      'allQrNumber': instance.allQrNumber,
      'cancelledQrNumber': instance.cancelledQrNumber,
      'completedQrNumber': instance.completedQrNumber,
      'pendingQrNumber': instance.pendingQrNumber,
      'holdQrNumber': instance.holdQrNumber,
      'scannedQrNumber': instance.scannedQrNumber,
    };
