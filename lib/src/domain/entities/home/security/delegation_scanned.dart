import 'package:city_eye/src/domain/entities/home/security/auth_extra_filed.dart';
import 'package:city_eye/src/domain/entities/home/security/owner_extra_filed.dart';
import 'package:equatable/equatable.dart';

class DelegationScanned extends Equatable {
  final int id;
  final String notes;
  final String name;
  final String personalID;
  final String fromDate;
  final String toDate;
  final String authName;
  final String authPersonalID;
  final String authMobile;
  final String ownerIDAttachment;
  final String authIDAttachment;
  final String ownerSignatureAttachment;
  final String authSignatureAttachment;
  final String authCountryCode;
  final int statusId;
  final bool isEnabled;
  final String qrImage;
  final int pinCode;
  final String documentDelegation;
  final List<OwnerExtraField> ownerExtraField;
  final List<AuthExtraField> authExtraField;

  const DelegationScanned({
    this.id = 0,
    this.notes = '',
    this.name = '',
    this.personalID = '',
    this.fromDate = '',
    this.toDate = '',
    this.authName = '',
    this.authPersonalID = '',
    this.authMobile = '',
    this.ownerIDAttachment = '',
    this.authIDAttachment = '',
    this.ownerSignatureAttachment = '',
    this.authSignatureAttachment = '',
    this.authCountryCode = '',
    this.statusId = 0,
    this.isEnabled = false,
    this.qrImage = '',
    this.pinCode = 0,
    this.documentDelegation = '',
    this.ownerExtraField = const [],
    this.authExtraField = const [],
  });

  @override
  List<Object?> get props => [
        id,
        notes,
        name,
        personalID,
        fromDate,
        toDate,
        authName,
        authPersonalID,
        authMobile,
        ownerIDAttachment,
        authIDAttachment,
        ownerSignatureAttachment,
        authSignatureAttachment,
        authCountryCode,
        statusId,
        isEnabled,
        qrImage,
        pinCode,
        documentDelegation,
        ownerExtraField,
        authExtraField,
      ];
}
