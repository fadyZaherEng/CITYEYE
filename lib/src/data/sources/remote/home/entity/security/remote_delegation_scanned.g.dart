// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_delegation_scanned.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteDelegationScanned _$RemoteDelegationScannedFromJson(
        Map<String, dynamic> json) =>
    RemoteDelegationScanned(
      id: json['id'] as int?,
      notes: json['notes'] as String?,
      name: json['name'] as String?,
      personalID: json['personalID'] as String?,
      fromDate: json['fromDate'] as String?,
      toDate: json['toDate'] as String?,
      authName: json['authName'] as String?,
      authPersonalID: json['authPersonalID'] as String?,
      authMobile: json['authMobile'] as String?,
      ownerIDAttachment: json['ownerIDAttachment'] as String?,
      authIDAttachment: json['authIDAttachment'] as String?,
      ownerSignatureAttachment: json['ownerSignatureAttachment'] as String?,
      authSignatureAttachment: json['authSignatureAttachment'] as String?,
      authCountryCode: json['authCountryCode'] as String?,
      statusId: json['statusId'] as int?,
      isEnabled: json['isEnabled'] as bool?,
      qrImage: json['qrImage'] as String?,
      pinCode: json['pinCode'] as int?,
      documentDelegation: json['documentDelegation'] as String?,
      ownerExtraField: (json['ownerExtraField'] as List<dynamic>?)
          ?.map(
              (e) => RemoteOwnerExtraField.fromJson(e as Map<String, dynamic>))
          .toList(),
      authExtraField: (json['authExtraField'] as List<dynamic>?)
          ?.map((e) => RemoteAuthExtraField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteDelegationScannedToJson(
        RemoteDelegationScanned instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notes': instance.notes,
      'name': instance.name,
      'personalID': instance.personalID,
      'fromDate': instance.fromDate,
      'toDate': instance.toDate,
      'authName': instance.authName,
      'authPersonalID': instance.authPersonalID,
      'authMobile': instance.authMobile,
      'ownerIDAttachment': instance.ownerIDAttachment,
      'authIDAttachment': instance.authIDAttachment,
      'ownerSignatureAttachment': instance.ownerSignatureAttachment,
      'authSignatureAttachment': instance.authSignatureAttachment,
      'authCountryCode': instance.authCountryCode,
      'statusId': instance.statusId,
      'isEnabled': instance.isEnabled,
      'qrImage': instance.qrImage,
      'pinCode': instance.pinCode,
      'documentDelegation': instance.documentDelegation,
      'ownerExtraField': instance.ownerExtraField,
      'authExtraField': instance.authExtraField,
    };
