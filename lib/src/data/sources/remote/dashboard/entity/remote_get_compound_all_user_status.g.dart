// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_compound_all_user_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetCompoundAllUserStatus _$RemoteGetCompoundAllUserStatusFromJson(
        Map<String, dynamic> json) =>
    RemoteGetCompoundAllUserStatus(
      active: json['active'] as int?,
      pending: json['pending'] as int?,
      notActive: json['notActive'] as int?,
    );

Map<String, dynamic> _$RemoteGetCompoundAllUserStatusToJson(
        RemoteGetCompoundAllUserStatus instance) =>
    <String, dynamic>{
      'active': instance.active,
      'pending': instance.pending,
      'notActive': instance.notActive,
    };
