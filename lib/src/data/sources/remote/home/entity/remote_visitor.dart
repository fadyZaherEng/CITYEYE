import 'package:city_eye/src/data/sources/remote/home/entity/remote_guest_type.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/remote_qr_code_status.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/remote_qr_type.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/remote_user_units.dart';
import 'package:city_eye/src/domain/entities/home/guest_type.dart';
import 'package:city_eye/src/domain/entities/home/qr_code_status.dart';
import 'package:city_eye/src/domain/entities/home/qr_type.dart';
import 'package:city_eye/src/domain/entities/home/user_units.dart';
import 'package:city_eye/src/domain/entities/home/visitor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_visitor.g.dart';

@JsonSerializable(explicitToJson: true)
final class RemoteVisitor {
  final int? id;
  final String? validFromDate;
  final String? validToDate;
  final int? pinCode;
  final String? guestName;
  final String? fromTime;
  final String? toTime;
  final String? ownerName;
  final RemoteGuestType? guestType;
  final RemoteQrCodeStatus? qrCodeStatus;
  final RemoteQrType? qrType;
  final RemoteUserUnits? userUnits;

  const RemoteVisitor({
    this.id = 0,
    this.validFromDate = "",
    this.validToDate = "",
    this.pinCode = 0,
    this.guestName = "",
    this.fromTime = "",
    this.toTime = "",
    this.ownerName = "",
    this.guestType = const RemoteGuestType(),
    this.qrCodeStatus = const RemoteQrCodeStatus(),
    this.qrType = const RemoteQrType(),
    this.userUnits = const RemoteUserUnits(),
  });

  factory RemoteVisitor.fromJson(Map<String, dynamic> json) =>
      _$RemoteVisitorFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteVisitorToJson(this);
}

extension RemoteVisitorExtension on RemoteVisitor {
  Visitor mapToDomain() => Visitor(
        id: id ?? 0,
        validFromDate: validFromDate ?? "",
        validToDate: validToDate ?? "",
        pinCode: pinCode ?? 0,
        guestName: guestName ?? "",
        ownerName: ownerName ?? "",
        fromTime: fromTime ?? "",
        toTime: toTime ?? "",
        guestType: guestType?.mapToDomain() ?? const GuestType(),
        qrCodeStatus: qrCodeStatus?.mapToDomain() ?? const QrCodeStatus(),
        qrType: qrType?.mapToDomain() ?? const QrType(),
        userUnits: userUnits?.mapToDomain() ?? const UserUnits(),
      );
}

extension RemoteVisitorListExtension on List<RemoteVisitor>? {
  List<Visitor> mapToDomain() => this!.map((e) => e.mapToDomain()).toList();
}
