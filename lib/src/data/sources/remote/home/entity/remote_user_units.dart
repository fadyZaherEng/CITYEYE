import 'package:city_eye/src/domain/entities/home/user_units.dart';
import 'package:json_annotation/json_annotation.dart';
part 'remote_user_units.g.dart';

@JsonSerializable()
final class RemoteUserUnits {
  final int? id;
  final String? number;
  final String? name;

  const RemoteUserUnits({
    this.id = 0,
    this.number = "",
    this.name = "",
  });

  factory RemoteUserUnits.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserUnitsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUserUnitsToJson(this);
}
extension RemoteUserUnitsExtension on RemoteUserUnits? {
  UserUnits mapToDomain() => UserUnits(
        id: this?.id ?? 0,
        number: this?.number ?? "",
        name: this?.name ?? "",
      );
}