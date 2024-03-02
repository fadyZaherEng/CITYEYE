import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_unit_qr_code_scanned.dart';
import 'package:city_eye/src/domain/entities/home/qr_code_details.dart';
import 'package:city_eye/src/domain/entities/home/security/unit_qr_code_scanned.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_qr_code_details.g.dart';

@JsonSerializable(explicitToJson: true)
final class RemoteQrCodeDetails {
  @JsonKey(name: 'isValid')
  final bool? isValid;
  @JsonKey(name: 'qrCodeDetails')
  final RemoteUnitsQRCodeScanned? unitsQRCodeScanned;

  const RemoteQrCodeDetails({
    this.isValid,
    this.unitsQRCodeScanned,
  });

  factory RemoteQrCodeDetails.fromJson(Map<String, dynamic> json) =>
      _$RemoteQrCodeDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteQrCodeDetailsToJson(this);
}

extension RemoteQrCodeDetailsExtension on RemoteQrCodeDetails? {
  QrCodeDetails mapToDomain() {
    return QrCodeDetails(
      isValid: this?.isValid ?? false,
      unitsQRCodeScanned:
          this?.unitsQRCodeScanned?.mapToDomain() ?? const UnitsQRCodeScanned(),
    );
  }
}
