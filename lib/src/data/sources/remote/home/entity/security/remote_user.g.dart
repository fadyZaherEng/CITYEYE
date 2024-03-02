// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteUser _$RemoteUserFromJson(Map<String, dynamic> json) => RemoteUser(
      id: json['id'] as int?,
      userName: json['userName'] as String?,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      image: json['image'] as String?,
      subscriberId: json['subscriberId'] as int?,
      status: json['status'],
      otpStatus: json['otpStatus'],
      contractDate: json['contractDate'],
    );

Map<String, dynamic> _$RemoteUserToJson(RemoteUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'fullName': instance.fullName,
      'email': instance.email,
      'mobile': instance.mobile,
      'image': instance.image,
      'subscriberId': instance.subscriberId,
      'status': instance.status,
      'otpStatus': instance.otpStatus,
      'contractDate': instance.contractDate,
    };
