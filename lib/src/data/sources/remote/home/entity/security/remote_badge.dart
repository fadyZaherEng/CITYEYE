import 'package:city_eye/src/data/sources/remote/home/entity/remote_qr_code_status.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_compunt_units.dart';
import 'package:city_eye/src/domain/entities/home/qr_code_status.dart';
import 'package:city_eye/src/domain/entities/home/security/badge.dart';
import 'package:city_eye/src/domain/entities/home/security/compount_unit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_badge.g.dart';

@JsonSerializable()
class RemoteBadge {
  final int? id;
  final String? qrImage;
  final int? pinCode;
  final String? expiredDate;
  final RemoteCompoundUnits? compoundUnits;
  final RemoteQrCodeStatus? qrCodeStatus;

  const RemoteBadge({
    this.id,
    this.qrImage,
    this.pinCode,
    this.expiredDate,
    this.compoundUnits,
    this.qrCodeStatus,
  });

  factory RemoteBadge.fromJson(Map<String, dynamic> json) =>
      _$RemoteBadgeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteBadgeToJson(this);
}

extension RemoteBadgeExtention on RemoteBadge? {
  Badge mapToDomain() {
    return Badge(
      id: this?.id ?? 0,
      qrImage: this?.qrImage ?? "",
      pinCode: this?.pinCode ?? 0,
      expiredDate: this?.expiredDate ?? "",
      compoundUnits:
          this?.compoundUnits?.mapToDomain() ?? const CompoundUnits(),
      qrCodeStatus: this?.qrCodeStatus?.mapToDomain() ?? const QrCodeStatus(),
    );
  }
}
