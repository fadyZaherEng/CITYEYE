import 'package:city_eye/src/domain/entities/home/security/user_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_user_type.g.dart';

@JsonSerializable()
class RemoteUserType {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'code')
  final String? code;

  const RemoteUserType({
    this.id,
    this.name,
    this.code,
  });

  factory RemoteUserType.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUserTypeToJson(this);
}

extension RemoteUserTypeExtention on RemoteUserType? {
  UserType mapToDomain() {
    return UserType(
      id: this?.id ?? 0,
      name: this?.name ?? "",
      code: this?.code ?? "",
    );
  }
}
