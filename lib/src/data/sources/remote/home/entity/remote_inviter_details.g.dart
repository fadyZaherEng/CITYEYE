// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_inviter_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteInviterDetails _$RemoteInviterDetailsFromJson(
        Map<String, dynamic> json) =>
    RemoteInviterDetails(
      inviterId: json['inviterId'] as int? ?? -1,
      inviterName: json['inviterName'] as String? ?? "",
      inviterPhoneNumber: json['inviterPhoneNumber'] as String? ?? "",
    );

Map<String, dynamic> _$RemoteInviterDetailsToJson(
        RemoteInviterDetails instance) =>
    <String, dynamic>{
      'inviterId': instance.inviterId,
      'inviterName': instance.inviterName,
      'inviterPhoneNumber': instance.inviterPhoneNumber,
    };
