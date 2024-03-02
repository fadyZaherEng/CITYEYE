// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_unit_qr_code_scanned.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteUnitsQRCodeScanned _$RemoteUnitsQRCodeScannedFromJson(
        Map<String, dynamic> json) =>
    RemoteUnitsQRCodeScanned(
      id: json['id'] as int?,
      name: json['name'] as String?,
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      imageUrl: json['imageUrl'] as String?,
      pdfUrl: json['pdfUrl'] as String?,
      pinCode: json['pinCode'] as int?,
      isEnabled: json['isEnabled'] as bool?,
      shareLink: json['shareLink'] as String?,
      address: json['address'] as String?,
      isRestricted: json['isRestricted'] as bool?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      createdDateStatus: json['createdDateStatus'] as String?,
      fromTime: json['fromTime'] as String?,
      toTime: json['toTime'] as String?,
      qrMessage: json['qrMessage'] as String?,
      guestType: json['guestType'] == null
          ? null
          : RemoteGuestType.fromJson(json['guestType'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : RemoteStatus.fromJson(json['status'] as Map<String, dynamic>),
      qrType: json['qrType'] == null
          ? null
          : RemoteQrType.fromJson(json['qrType'] as Map<String, dynamic>),
      inviterDetails: json['inviterDetails'] == null
          ? null
          : RemoteInviterDetails.fromJson(
              json['inviterDetails'] as Map<String, dynamic>),
      unitsQRCodeDays: (json['unitsQRCodeDays'] as List<dynamic>?)
          ?.map(
              (e) => RemoteUnitsQrCodeDays.fromJson(e as Map<String, dynamic>))
          .toList(),
      unitQRQuestionAnswers: (json['unitQRQuestionAnswers'] as List<dynamic>?)
          ?.map((e) =>
              RemoteUnitQrQuestionAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteUnitsQRCodeScannedToJson(
        RemoteUnitsQRCodeScanned instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'imageUrl': instance.imageUrl,
      'pdfUrl': instance.pdfUrl,
      'pinCode': instance.pinCode,
      'isEnabled': instance.isEnabled,
      'shareLink': instance.shareLink,
      'address': instance.address,
      'isRestricted': instance.isRestricted,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'createdDateStatus': instance.createdDateStatus,
      'fromTime': instance.fromTime,
      'toTime': instance.toTime,
      'qrMessage': instance.qrMessage,
      'guestType': instance.guestType,
      'status': instance.status,
      'qrType': instance.qrType,
      'inviterDetails': instance.inviterDetails,
      'unitsQRCodeDays': instance.unitsQRCodeDays,
      'unitQRQuestionAnswers': instance.unitQRQuestionAnswers,
    };
