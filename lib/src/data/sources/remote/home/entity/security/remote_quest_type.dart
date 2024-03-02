import 'package:city_eye/src/domain/entities/home/security/quest_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_quest_type.g.dart';

@JsonSerializable()
class RemoteGuestType {
  final int? id;
  final String? code;
  final String? name;

  const RemoteGuestType({
    this.id,
    this.code,
    this.name,
  });

  factory RemoteGuestType.fromJson(Map<String, dynamic> json) =>
      _$RemoteGuestTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGuestTypeToJson(this);
}

extension RemoteGuestTypeExtention on RemoteGuestType? {
  GuestType mapToDomain() {
    return GuestType(
      id: this?.id ?? 0,
      code: this?.code ?? "",
      name: this?.name ?? "",
    );
  }
}
