// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteUser _$RemoteUserFromJson(Map<String, dynamic> json) => RemoteUser(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? "",
      email: json['email'] as String? ?? "",
      mobileNumber: json['mobileNumber'] as String? ?? "",
      image: json['image'] as String? ?? "",
      compoundId: json['compoundId'] as int? ?? -1,
      compoundName: json['compoundName'] as String? ?? "",
      userType: json['userType'] == null
          ? const RemoteUserType()
          : RemoteUserType.fromJson(json['userType'] as Map<String, dynamic>),
      token: json['token'] as String? ?? "",
      userDeviceInfo: json['userDeviceInfo'] == null
          ? const RemoteUserDeviceInfo()
          : RemoteUserDeviceInfo.fromJson(
              json['userDeviceInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteUserToJson(RemoteUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'image': instance.image,
      'compoundId': instance.compoundId,
      'compoundName': instance.compoundName,
      'userType': instance.userType?.toJson(),
      'userDeviceInfo': instance.userDeviceInfo?.toJson(),
      'token': instance.token,
    };
