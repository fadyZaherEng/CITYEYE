import 'package:city_eye/src/domain/entities/home/security/owner_extra_filed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_extra_owner.g.dart';

@JsonSerializable()
class RemoteOwnerExtraField {
  final int? id;
  final int? controlTypeId;
  final String? controlTypeCode;
  final String? lable;
  final bool? isRequired;
  final String? value;
  final List<dynamic>? choice;
  final List<dynamic>? formControlsValidation;

  const RemoteOwnerExtraField({
    this.id,
    this.controlTypeId,
    this.controlTypeCode,
    this.lable,
    this.isRequired,
    this.value,
    this.choice,
    this.formControlsValidation,
  });

  factory RemoteOwnerExtraField.fromJson(Map<String, dynamic> json) =>
      _$RemoteOwnerExtraFieldFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOwnerExtraFieldToJson(this);
}

extension RemoteOwnerExtraFieldExtention on RemoteOwnerExtraField? {
  OwnerExtraField mapToDomain() {
    return OwnerExtraField(
      controlTypeCode: this?.controlTypeCode ?? "",
      controlTypeId: this?.controlTypeId ?? 0,
      id: this?.id ?? 0,
      isRequired: this?.isRequired ?? false,
      lable: this?.lable ?? "",
      value: this?.value ?? "",
      choice: this?.choice ?? const [],
      formControlsValidation: this?.formControlsValidation ?? const [],
    );
  }
}
