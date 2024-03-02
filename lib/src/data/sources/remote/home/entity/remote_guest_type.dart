import 'package:city_eye/src/domain/entities/home/guest_type.dart';
import 'package:json_annotation/json_annotation.dart';
part 'remote_guest_type.g.dart';

@JsonSerializable()
final class RemoteGuestType {
  final int? id;
  final String? code;
  final String? name;

  const RemoteGuestType({
    this.id = 0,
    this.code = "",
    this.name = "",
  });

  factory RemoteGuestType.fromJson(Map<String, dynamic> json) =>
      _$RemoteGuestTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGuestTypeToJson(this);
}
extension RemoteGuestTypeExtension on RemoteGuestType? {
  GuestType mapToDomain() => GuestType(
        id: this?.id ?? 0,
        code: this?.code ?? "",
        name: this?.name ?? "",
      );
}