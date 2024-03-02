import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_badge_scanned.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_delegation_scanned.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_service_scanned.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_unit_qr_code_scanned.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_user_unit_info.dart';
import 'package:city_eye/src/domain/entities/home/security/badge_scanned.dart';
import 'package:city_eye/src/domain/entities/home/security/delegation_scanned.dart';
import 'package:city_eye/src/domain/entities/home/security/service_scanned.dart';
import 'package:city_eye/src/domain/entities/home/security/unit_qr_code_scanned.dart';
import 'package:city_eye/src/domain/entities/home/security/user_unit_info.dart';
import 'package:city_eye/src/domain/entities/home/security/validate_visitor_qr_code_in.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_validate_visitor_qr_code_in.g.dart';

@JsonSerializable()
class RemoteValidateVisitorQrCodeIn {
  @JsonKey(name: 'sorceKey')
  final int? sorceKey;
  @JsonKey(name: 'isValid')
  final bool? isValid;
  @JsonKey(name: 'userUnitInfo')
  final RemoteUserUnitInfo? userUnitInfo;
  @JsonKey(name: 'badgeScanned')
  final RemoteBadgeScanned? badgeScanned;
  @JsonKey(name: 'serviceScanned')
  final RemoteServiceScanned? serviceScanned;
  @JsonKey(name: 'delegationScanned')
  final RemoteDelegationScanned? delegationScanned;
  @JsonKey(name: 'unitsQRCodeScanned')
  final RemoteUnitsQRCodeScanned? unitsQRCodeScanned;

  const RemoteValidateVisitorQrCodeIn({
    this.sorceKey,
    this.isValid,
    this.userUnitInfo,
    this.badgeScanned,
    this.serviceScanned,
    this.delegationScanned,
    this.unitsQRCodeScanned,
  });

  factory RemoteValidateVisitorQrCodeIn.fromJson(Map<String, dynamic> json) =>
      _$RemoteValidateVisitorQrCodeInFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteValidateVisitorQrCodeInToJson(this);
}

extension RemoteValidateVisitorQrCodeInExtention
    on RemoteValidateVisitorQrCodeIn? {
  ValidateVisitorQrCodeIn mapToDomain() {
    return ValidateVisitorQrCodeIn(
      sorceKey: this?.sorceKey ?? 0,
      isValid: this?.isValid ?? false,
      userUnitInfo: this?.userUnitInfo?.mapToDomain() ?? const UserUnitInfo(),
      badgeScanned: this?.badgeScanned?.mapToDomain() ?? const BadgeScanned(),
      serviceScanned:
          this?.serviceScanned?.mapToDomain() ?? const ServiceScanned(),
      delegationScanned:
          this?.delegationScanned?.mapToDomain() ?? const DelegationScanned(),
      unitsQRCodeScanned:
          this?.unitsQRCodeScanned?.mapToDomain() ?? const UnitsQRCodeScanned(),
    );
  }
}
