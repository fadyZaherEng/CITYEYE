// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_user_unit_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteUserUnitInfo _$RemoteUserUnitInfoFromJson(Map<String, dynamic> json) =>
    RemoteUserUnitInfo(
      id: json['id'] as int?,
      userType: json['userType'] == null
          ? null
          : RemoteUserType.fromJson(json['userType'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : RemoteUser.fromJson(json['user'] as Map<String, dynamic>),
      compoundName: json['compoundName'] as String?,
      unitNO: json['unitNO'] as String?,
      unitName: json['unitName'] as String?,
      gasNO: json['gasNO'] as String?,
      telephone: json['telephone'] as String?,
    );

Map<String, dynamic> _$RemoteUserUnitInfoToJson(RemoteUserUnitInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userType': instance.userType,
      'user': instance.user,
      'compoundName': instance.compoundName,
      'unitNO': instance.unitNO,
      'unitName': instance.unitName,
      'gasNO': instance.gasNO,
      'telephone': instance.telephone,
    };
