import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_invinter_details.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_qr_type.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_quest_type.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_status.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_unit_qr_code_question_answer.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_units_qr_code_days.dart';
import 'package:city_eye/src/domain/entities/home/security/inviter_details.dart';
import 'package:city_eye/src/domain/entities/home/security/qr_type.dart';
import 'package:city_eye/src/domain/entities/home/security/quest_type.dart';
import 'package:city_eye/src/domain/entities/home/security/status.dart';
import 'package:city_eye/src/domain/entities/home/security/unit_qr_code_scanned.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_unit_qr_code_scanned.g.dart';

@JsonSerializable()
class RemoteUnitsQRCodeScanned {
  final int? id;
  final String? name;
  final String? fromDate;
  final String? toDate;
  final String? imageUrl;
  final String? pdfUrl;
  final int? pinCode;
  final bool? isEnabled;
  final String? shareLink;
  final String? address;
  final bool? isRestricted;
  final String? latitude;
  final String? longitude;
  final String? createdDateStatus;
  final String? fromTime;
  final String? toTime;
  final String? qrMessage;
  final RemoteGuestType? guestType;
  final RemoteStatus? status;
  final RemoteQrType? qrType;
  final RemoteInviterDetails? inviterDetails;
  final List<RemoteUnitsQrCodeDays>? unitsQRCodeDays;
  final List<RemoteUnitQrQuestionAnswer>? unitQRQuestionAnswers;

  const RemoteUnitsQRCodeScanned({
    this.id,
    this.name,
    this.fromDate,
    this.toDate,
    this.imageUrl,
    this.pdfUrl,
    this.pinCode,
    this.isEnabled,
    this.shareLink,
    this.address,
    this.isRestricted,
    this.latitude,
    this.longitude,
    this.createdDateStatus,
    this.fromTime,
    this.toTime,
    this.qrMessage,
    this.guestType,
    this.status,
    this.qrType,
    this.inviterDetails,
    this.unitsQRCodeDays,
    this.unitQRQuestionAnswers,
  });

  factory RemoteUnitsQRCodeScanned.fromJson(Map<String, dynamic> json) =>
      _$RemoteUnitsQRCodeScannedFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUnitsQRCodeScannedToJson(this);
}

extension RemoteUnitQrCodeScannedExtention on RemoteUnitsQRCodeScanned? {
  UnitsQRCodeScanned mapToDomain() {
    return UnitsQRCodeScanned(
      name: this?.name ?? "",
      fromDate: this?.fromDate ?? "",
      toDate: this?.toDate ?? "",
      imageUrl: this?.imageUrl ?? "",
      pdfUrl: this?.pdfUrl ?? "",
      pinCode: this?.pinCode ?? 0,
      isEnabled: this?.isEnabled ?? false,
      shareLink: this?.shareLink ?? "",
      address: this?.address ?? "",
      latitude: this?.latitude ?? "",
      isRestricted: this?.isRestricted ?? false,
      longitude: this?.longitude ?? "",
      createdDateStatus: this?.createdDateStatus ?? "",
      fromTime: this?.fromTime ?? "",
      toTime: this?.toTime ?? "",
      qrMessage: this?.qrMessage ?? "",
      guestType: this?.guestType?.mapToDomain() ?? const GuestType(),
      status: this?.status?.mapToDomain() ?? const Status(),
      qrType: this?.qrType?.mapToDomain() ?? const QrType(),
      inviterDetails:
          this?.inviterDetails?.mapToDomain() ?? const InviterDetails(),
      unitsQRCodeDays: this?.unitsQRCodeDays.mapToDomain() ?? const [],
      unitQRQuestionAnswers:
          this?.unitQRQuestionAnswers?.mapToDomain() ?? const [],
      id: this?.id ?? 0,
    );
  }
}
