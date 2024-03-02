import 'package:city_eye/src/domain/entities/home/security/status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_status.g.dart';

@JsonSerializable()
class RemoteStatus {
  final int? id;
  final String? code;
  final String? name;
  final String? color;

  const RemoteStatus({
    this.id,
    this.code,
    this.name,
    this.color,
  });

  factory RemoteStatus.fromJson(Map<String, dynamic> json) =>
      _$RemoteStatusFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteStatusToJson(this);
}

extension RemoteStatusExtention on RemoteStatus? {
  Status mapToDomain() {
    return Status(
      id: this?.id ?? 0,
      code: this?.code ?? "",
      name: this?.name ?? "",
      color: this?.color ?? "",
    );
  }
}
