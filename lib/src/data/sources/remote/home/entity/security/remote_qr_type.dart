import 'package:city_eye/src/domain/entities/home/security/qr_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_qr_type.g.dart';

@JsonSerializable()
class RemoteQrType {
  final int? id;
  final String? name;
  final String? code;

  const RemoteQrType({
    this.id,
    this.name,
    this.code,
  });

  factory RemoteQrType.fromJson(Map<String, dynamic> json) =>
      _$RemoteQrTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteQrTypeToJson(this);
}

extension RemoteQrTypeExtention on RemoteQrType? {
  QrType mapToDomain() {
    return QrType(
      id: this?.id ?? 0,
      name: this?.name ?? "",
      code: this?.code ?? "",
    );
  }
}
