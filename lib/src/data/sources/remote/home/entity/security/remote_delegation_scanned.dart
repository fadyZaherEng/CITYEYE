import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_auth_extra_filed.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_extra_owner.dart';
import 'package:city_eye/src/domain/entities/home/security/delegation_scanned.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_delegation_scanned.g.dart';

@JsonSerializable()
class RemoteDelegationScanned {
  final int? id;
  final String? notes;
  final String? name;
  final String? personalID;
  final String? fromDate;
  final String? toDate;
  final String? authName;
  final String? authPersonalID;
  final String? authMobile;
  final String? ownerIDAttachment;
  final String? authIDAttachment;
  final String? ownerSignatureAttachment;
  final String? authSignatureAttachment;
  final String? authCountryCode;
  final int? statusId;
  final bool? isEnabled;
  final String? qrImage;
  final int? pinCode;
  final String? documentDelegation;
  final List<RemoteOwnerExtraField>? ownerExtraField;
  final List<RemoteAuthExtraField>? authExtraField;

  const RemoteDelegationScanned({
    this.id,
    this.notes,
    this.name,
    this.personalID,
    this.fromDate,
    this.toDate,
    this.authName,
    this.authPersonalID,
    this.authMobile,
    this.ownerIDAttachment,
    this.authIDAttachment,
    this.ownerSignatureAttachment,
    this.authSignatureAttachment,
    this.authCountryCode,
    this.statusId,
    this.isEnabled,
    this.qrImage,
    this.pinCode,
    this.documentDelegation,
    this.ownerExtraField,
    this.authExtraField,
  });

  factory RemoteDelegationScanned.fromJson(Map<String, dynamic> json) =>
      _$RemoteDelegationScannedFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteDelegationScannedToJson(this);
}

extension RemoteDelegationScannedExtention on RemoteDelegationScanned? {
  DelegationScanned mapToDomain() {
    return DelegationScanned(
      toDate: this?.toDate ?? "",
      fromDate: this?.fromDate ?? "",
      id: this?.id ?? 0,
      notes: this?.notes ?? "",
      name: this?.name ?? "",
      personalID: this?.personalID ?? "",
      authName: this?.authName ?? "",
      authPersonalID: this?.authPersonalID ?? "",
      authMobile: this?.authMobile ?? "",
      ownerIDAttachment: this?.ownerIDAttachment ?? "",
      authIDAttachment: this?.authIDAttachment ?? "",
      ownerSignatureAttachment: this?.ownerSignatureAttachment ?? "",
      authSignatureAttachment: this?.authSignatureAttachment ?? "",
      authCountryCode: this?.authCountryCode ?? "",
      statusId: this?.statusId ?? 0,
      isEnabled: this?.isEnabled ?? false,
      qrImage: this?.qrImage ?? "",
      pinCode: this?.pinCode ?? 0,
      documentDelegation: this?.documentDelegation ?? "",
      authExtraField:
          this!.authExtraField?.map((e) => e.mapToDomain()).toList() ?? [],
      ownerExtraField:
          this!.ownerExtraField?.map((e) => e.mapToDomain()).toList() ?? [],
    );
  }
}
