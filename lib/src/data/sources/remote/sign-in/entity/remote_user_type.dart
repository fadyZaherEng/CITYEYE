import 'package:city_eye/src/domain/entities/sign_in/user.dart';
import 'package:city_eye/src/domain/entities/sign_in/user_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_user_type.g.dart';

@JsonSerializable()
final class RemoteUserType {
  final int? id;
  final String? name;
  final String? code;

  const RemoteUserType({
    this.id = -1,
    this.name = "",
    this.code = "",
  });

  factory RemoteUserType.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUserTypeToJson(this);
}

extension RemoteUserTypeExtension on RemoteUserType? {
  UserType mapToDomain() => UserType(
        id: this?.id ?? -1,
        name: this?.name ?? "",
        code: this?.code ?? "",
      );
}
