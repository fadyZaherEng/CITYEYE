import 'package:city_eye/src/domain/entities/home/security/inviter_details.dart';
import 'package:city_eye/src/domain/entities/home/security/qr_type.dart';
import 'package:city_eye/src/domain/entities/home/security/quest_type.dart';
import 'package:city_eye/src/domain/entities/home/security/status.dart';
import 'package:city_eye/src/domain/entities/home/security/unit_qr_code_question_answer.dart';
import 'package:city_eye/src/domain/entities/home/security/units_qr_code_days.dart';
import 'package:equatable/equatable.dart';

class UnitsQRCodeScanned extends Equatable {
  final int id;
  final String name;
  final String fromDate;
  final String toDate;
  final String imageUrl;
  final String pdfUrl;
  final int pinCode;
  final bool isEnabled;
  final String shareLink;
  final String address;
  final String latitude;
  final String longitude;
  final String createdDateStatus;
  final String fromTime;
  final String toTime;
  final String qrMessage;
  final bool isRestricted;
  final GuestType guestType;
  final Status status;
  final QrType qrType;
  final InviterDetails inviterDetails;
  final List<UnitsQrCodeDays> unitsQRCodeDays;
  final List<UnitQrQuestionAnswer> unitQRQuestionAnswers;

  const UnitsQRCodeScanned({
    this.id = 0,
    this.name = '',
    this.isRestricted = false,
    this.fromDate = '',
    this.toDate = '',
    this.imageUrl = '',
    this.pdfUrl = '',
    this.pinCode = 0,
    this.isEnabled = false,
    this.shareLink = '',
    this.address = '',
    this.latitude = '',
    this.longitude = '',
    this.createdDateStatus = '',
    this.fromTime = '',
    this.toTime = '',
    this.qrMessage = '',
    this.guestType = const GuestType(),
    this.status = const Status(),
    this.qrType = const QrType(),
    this.inviterDetails = const InviterDetails(),
    this.unitsQRCodeDays = const [],
    this.unitQRQuestionAnswers = const [],
  });

  @override
  List<Object?> get props => [
        id,
        name,
        fromDate,
        toDate,
        imageUrl,
        pdfUrl,
        pinCode,
        isEnabled,
        shareLink,
        address,
        latitude,
        longitude,
        createdDateStatus,
        fromTime,
        toTime,
        qrMessage,
        guestType,
        status,
        qrType,
        inviterDetails,
        unitsQRCodeDays,
        unitQRQuestionAnswers
      ];
}
