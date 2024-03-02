import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_parent.dart';
import 'package:city_eye/src/domain/entities/home/security/parent.dart';
import 'package:city_eye/src/domain/entities/home/security/service_category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_service_category.g.dart';

@JsonSerializable()
class RemoteServiceCategory {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'logo')
  final String? logo;
  @JsonKey(name: 'parent')
  final RemoteParent? parent;

  const RemoteServiceCategory({
    this.id,
    this.name,
    this.code,
    this.logo,
    this.parent,
  });

  factory RemoteServiceCategory.fromJson(Map<String, dynamic> json) =>
      _$RemoteServiceCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteServiceCategoryToJson(this);
}

extension RemoteServiceCategoryExtention on RemoteServiceCategory? {
  ServiceCategory mapToDomain() {
    return ServiceCategory(
      id: this?.id ?? 0,
      name: this?.name ?? "",
      code: this?.code ?? "",
      logo: this?.logo ?? "",
      parent: this?.parent?.mapToDomain() ?? const Parent(),
    );
  }
}
