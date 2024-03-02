import 'package:city_eye/src/domain/entities/home/qr_code_status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_qr_code_status.g.dart';

@JsonSerializable()
class RemoteQrCodeStatus {
  final int? id;
  final String? code;
  final String? name;
  final String? color;

  const RemoteQrCodeStatus({
    this.id,
    this.code,
    this.name,
    this.color,
  });

  factory RemoteQrCodeStatus.fromJson(Map<String, dynamic> json) =>
      _$RemoteQrCodeStatusFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteQrCodeStatusToJson(this);
}

extension RemoteQrCodeStatusExtention on RemoteQrCodeStatus? {
  QrCodeStatus mapToDomain() {
    return QrCodeStatus(
      id: this?.id ?? 0,
      code: this?.code ?? "",
      name: this?.name ?? "",
      color: this?.color ?? "",
    );
  }
}
