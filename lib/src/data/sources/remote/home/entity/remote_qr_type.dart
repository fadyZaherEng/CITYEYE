import 'package:city_eye/src/domain/entities/home/qr_type.dart';
import 'package:json_annotation/json_annotation.dart';
part 'remote_qr_type.g.dart';

@JsonSerializable()
final class RemoteQrType {
  final int? id;
  final String? code;
  final String? name;

  const RemoteQrType({
    this.id = 0,
    this.code = "",
    this.name = "",
  });

  factory RemoteQrType.fromJson(Map<String, dynamic> json) =>
      _$RemoteQrTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteQrTypeToJson(this);
}

extension RemoteQrTypeExtension on RemoteQrType? {
  QrType mapToDomain() => QrType(
        id: this?.id ?? 0,
        code: this?.code ?? "",
        name: this?.name ?? "",
      );
}
