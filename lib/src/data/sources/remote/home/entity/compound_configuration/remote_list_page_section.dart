import 'package:city_eye/src/data/sources/remote/home/entity/compound_configuration/remote_multimedia_type.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/list_page_section.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_list_page_section.g.dart';

@JsonSerializable()
class RemoteListOfPageSections {
  final int? id;
  final int? pageId;
  final String? pageCode;
  final List<RemoteMultiMediaTypes>? multiMediaTypes;

  const RemoteListOfPageSections({
    this.id,
    this.pageId,
    this.pageCode,
    this.multiMediaTypes,
  });

  factory RemoteListOfPageSections.fromJson(Map<String, dynamic> json) =>
      _$RemoteListOfPageSectionsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteListOfPageSectionsToJson(this);
}

extension RemoteListOfPageSectionsX on RemoteListOfPageSections? {
  ListOfPageSections toDomain() {
    return ListOfPageSections(
      id: this?.id ?? 0,
      pageId: this?.pageId ?? 0,
      pageCode: this?.pageCode ?? '',
      multiMediaTypes: this?.multiMediaTypes?.toDomain() ?? [],
    );
  }
}
