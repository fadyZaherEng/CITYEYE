import 'package:city_eye/src/domain/entities/home/security/badge_scanned.dart';
import 'package:city_eye/src/domain/entities/home/security/delegation_scanned.dart';
import 'package:city_eye/src/domain/entities/home/security/service_scanned.dart';
import 'package:city_eye/src/domain/entities/home/security/unit_qr_code_scanned.dart';
import 'package:city_eye/src/domain/entities/home/security/user_unit_info.dart';

class ValidateVisitorQrCodeIn {
  final int sorceKey;
  final bool isValid;
  final UserUnitInfo userUnitInfo;
  final BadgeScanned badgeScanned;
  final ServiceScanned serviceScanned;
  final DelegationScanned delegationScanned;
  final UnitsQRCodeScanned unitsQRCodeScanned;

  const ValidateVisitorQrCodeIn({
    required this.sorceKey,
    required this.isValid,
    this.userUnitInfo = const UserUnitInfo(),
    this.badgeScanned = const BadgeScanned(),
    this.serviceScanned = const ServiceScanned(),
    this.delegationScanned = const DelegationScanned(),
    this.unitsQRCodeScanned = const UnitsQRCodeScanned(),
  });
}
