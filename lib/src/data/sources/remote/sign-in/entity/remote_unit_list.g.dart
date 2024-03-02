// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_unit_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteUnitLists _$RemoteUnitListsFromJson(Map<String, dynamic> json) =>
    RemoteUnitLists(
      id: json['id'] as int?,
      compoundId: json['compoundId'] as int?,
      compoundName: json['compoundName'] as String?,
      unitId: json['unitId'] as int?,
      unitNo: json['unitNo'] as String?,
      unitName: json['unitName'] as String?,
      compoundLogo: json['compoundLogo'] as String?,
      address: json['address'] as String?,
      isActive: json['isActive'] as bool?,
      userTypeId: json['userTypeId'] as int?,
      userTypeName: json['userTypeName'] as String?,
      userUnitContractEndDate: json['userUnitContractEndDate'] as String?,
      isCompoundVerified: json['isCompoundVerified'] as bool?,
    );

Map<String, dynamic> _$RemoteUnitListsToJson(RemoteUnitLists instance) =>
    <String, dynamic>{
      'id': instance.id,
      'compoundId': instance.compoundId,
      'compoundName': instance.compoundName,
      'unitId': instance.unitId,
      'unitNo': instance.unitNo,
      'unitName': instance.unitName,
      'compoundLogo': instance.compoundLogo,
      'address': instance.address,
      'isActive': instance.isActive,
      'userTypeId': instance.userTypeId,
      'userTypeName': instance.userTypeName,
      'userUnitContractEndDate': instance.userUnitContractEndDate,
      'isCompoundVerified': instance.isCompoundVerified,
    };
