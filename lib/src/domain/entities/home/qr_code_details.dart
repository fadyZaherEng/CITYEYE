import 'package:city_eye/src/domain/entities/home/security/unit_qr_code_scanned.dart';
import 'package:equatable/equatable.dart';

final class QrCodeDetails extends Equatable {
  final bool isValid;
  final UnitsQRCodeScanned unitsQRCodeScanned;

  const QrCodeDetails({
    this.isValid = false,
    this.unitsQRCodeScanned = const UnitsQRCodeScanned(),
  });

  @override
  List<Object?> get props => [isValid, unitsQRCodeScanned];
}
