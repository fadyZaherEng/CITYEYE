import 'package:city_eye/src/domain/entities/home/guest_type.dart';
import 'package:city_eye/src/domain/entities/home/qr_code_status.dart';
import 'package:city_eye/src/domain/entities/home/qr_type.dart';
import 'package:city_eye/src/domain/entities/home/user_units.dart';
import 'package:equatable/equatable.dart';

final class Visitor extends Equatable {
  final int id;
  final String validFromDate;
  final String validToDate;
  final int pinCode;
  final String guestName;
  final String fromTime;
  final String toTime;
  final String ownerName;
  final GuestType guestType;
  final QrCodeStatus qrCodeStatus;
  final QrType qrType;
  final UserUnits userUnits;

  const Visitor({
    this.id = 0,
    this.validFromDate = "",
    this.validToDate = "",
    this.pinCode = 0,
    this.guestName = "",
    this.fromTime = "",
    this.toTime = "",
    this.ownerName = "",
    this.guestType = const GuestType(),
    this.qrCodeStatus = const QrCodeStatus(),
    this.qrType = const QrType(),
    this.userUnits = const UserUnits(),
  });

  Visitor copyWith({
    int? id,
    String? validFromDate,
    String? validToDate,
    int? pinCode,
    String? guestName,
    String? ownerName,
    String? fromTime,
    String? toTime,
    GuestType? guestType,
    QrCodeStatus? qrCodeStatus,
    QrType? qrType,
    UserUnits? userUnits,
  }) {
    return Visitor(
        id: id ?? this.id,
        validFromDate: validFromDate ?? this.validFromDate,
        validToDate: validToDate ?? this.validToDate,
        pinCode: pinCode ?? this.pinCode,
        guestName: guestName ?? this.guestName,
        ownerName: ownerName ?? this.ownerName,
        guestType: guestType ?? this.guestType,
        fromTime: fromTime ?? this.fromTime,
        toTime: toTime ?? this.toTime,
        qrCodeStatus: qrCodeStatus ?? this.qrCodeStatus,
        qrType: qrType ?? this.qrType,
        userUnits: userUnits ?? this.userUnits);
  }


  @override
  String toString() {
    return 'Visitor{guestName: $guestName, ownerName: $ownerName, qrType: $qrType}';
  }

  @override
  List<Object> get props => [
        id,
        validFromDate,
        validToDate,
        pinCode,
        guestName,
        ownerName,
        guestType,
        fromTime,
        toTime,
        qrCodeStatus,
        qrType,
        userUnits,
      ];
}
