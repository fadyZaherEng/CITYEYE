// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_list_page_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteListOfPageSections _$RemoteListOfPageSectionsFromJson(
        Map<String, dynamic> json) =>
    RemoteListOfPageSections(
      id: json['id'] as int?,
      pageId: json['pageId'] as int?,
      pageCode: json['pageCode'] as String?,
      multiMediaTypes: (json['multiMediaTypes'] as List<dynamic>?)
          ?.map(
              (e) => RemoteMultiMediaTypes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RemoteListOfPageSectionsToJson(
        RemoteListOfPageSections instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pageId': instance.pageId,
      'pageCode': instance.pageCode,
      'multiMediaTypes': instance.multiMediaTypes,
    };
