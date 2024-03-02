// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteUserInfo _$RemoteUserInfoFromJson(Map<String, dynamic> json) =>
    RemoteUserInfo(
      id: json['id'] as int?,
      userName: json['userName'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      image: json['image'] as String?,
      status: json['status'] as bool?,
      otpStatus: json['otpStatus'] as bool?,
      subscriberId: json['subscriberId'] as int?,
    );

Map<String, dynamic> _$RemoteUserInfoToJson(RemoteUserInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'fullName': instance.fullName,
      'email': instance.email,
      'mobile': instance.mobile,
      'image': instance.image,
      'status': instance.status,
      'otpStatus': instance.otpStatus,
      'subscriberId': instance.subscriberId,
    };
