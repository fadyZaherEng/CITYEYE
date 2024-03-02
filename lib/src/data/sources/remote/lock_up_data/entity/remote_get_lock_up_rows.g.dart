// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_get_lock_up_rows.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteGetLockUpRows _$RemoteGetLockUpRowsFromJson(Map<String, dynamic> json) =>
    RemoteGetLockUpRows(
      lookupCode: json['lookupCode'] as String?,
      lookupFiles: (json['lookupFiles'] as List<dynamic>?)
          ?.map((e) => RemoteLookupFiles.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteGetLockUpRowsToJson(
        RemoteGetLockUpRows instance) =>
    <String, dynamic>{
      'lookupCode': instance.lookupCode,
      'lookupFiles': instance.lookupFiles,
    };

RemoteLookupFiles _$RemoteLookupFilesFromJson(Map<String, dynamic> json) =>
    RemoteLookupFiles(
      id: json['id'] as int?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      sortNo: json['sortNo'] as int?,
    );

Map<String, dynamic> _$RemoteLookupFilesToJson(RemoteLookupFiles instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'sortNo': instance.sortNo,
    };
