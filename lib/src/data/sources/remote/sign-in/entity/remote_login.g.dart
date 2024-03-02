// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteLogin _$RemoteLoginFromJson(Map<String, dynamic> json) => RemoteLogin(
      userInfo: json['userInfo'] == null
          ? null
          : RemoteUserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
      unitLists: (json['unitLists'] as List<dynamic>?)
          ?.map((e) => RemoteUnitLists.fromJson(e as Map<String, dynamic>))
          .toList(),
      token: json['token'] as String?,
      userDeviceInfo: json['userDeviceInfo'] == null
          ? null
          : RemoteUserDeviceInfo.fromJson(
              json['userDeviceInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteLoginToJson(RemoteLogin instance) =>
    <String, dynamic>{
      'userInfo': instance.userInfo,
      'unitLists': instance.unitLists,
      'token': instance.token,
      'userDeviceInfo': instance.userDeviceInfo,
    };
