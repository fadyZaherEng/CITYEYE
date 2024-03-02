import 'package:city_eye/src/domain/entities/home/qr_code_status.dart';
import 'package:city_eye/src/domain/entities/home/security/compount_unit.dart';
import 'package:equatable/equatable.dart';

class Badge extends Equatable {
  final int id;
  final String qrImage;
  final int pinCode;
  final String expiredDate;
  final CompoundUnits compoundUnits;
  final QrCodeStatus qrCodeStatus;

  const Badge({
    this.id = 0,
    this.qrImage = '',
    this.pinCode = 0,
    this.expiredDate = '',
    this.compoundUnits = const CompoundUnits(),
    this.qrCodeStatus = const QrCodeStatus(),
  });

  @override
  List<Object?> get props =>
      [id, qrImage, pinCode, expiredDate, compoundUnits, qrCodeStatus];
}
