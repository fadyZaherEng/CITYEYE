import 'package:city_eye/src/domain/entities/home/security/parent.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_parent.g.dart';

@JsonSerializable()
class RemoteParent {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'logo')
  final String? logo;

  const RemoteParent({
    this.id,
    this.name,
    this.code,
    this.logo,
  });

  factory RemoteParent.fromJson(Map<String, dynamic> json) =>
      _$RemoteParentFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteParentToJson(this);
}

extension RemoteParentExtention on RemoteParent? {
  Parent mapToDomain() {
    return Parent(
      id: this?.id ?? 0,
      name: this?.name ?? "",
      code: this?.code ?? "",
      logo: this?.logo ?? "",
    );
  }
}
