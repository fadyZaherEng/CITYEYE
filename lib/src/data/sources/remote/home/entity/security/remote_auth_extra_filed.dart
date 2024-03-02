import 'package:city_eye/src/domain/entities/home/security/auth_extra_filed.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_auth_extra_filed.g.dart';

@JsonSerializable()
class RemoteAuthExtraField {
  final int? id;
  final int? controlTypeId;
  final String? controlTypeCode;
  final String? lable;
  final bool? isRequired;
  final String? value;
  final List<dynamic>? choice;
  final List<dynamic>? formControlsValidation;

  const RemoteAuthExtraField({
    this.id,
    this.controlTypeId,
    this.controlTypeCode,
    this.lable,
    this.isRequired,
    this.value,
    this.choice,
    this.formControlsValidation,
  });

  factory RemoteAuthExtraField.fromJson(Map<String, dynamic> json) =>
      _$RemoteAuthExtraFieldFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAuthExtraFieldToJson(this);
}

extension RemoteAuthExtraFieldExtention on RemoteAuthExtraField? {
  AuthExtraField mapToDomain() {
    return AuthExtraField(
      controlTypeCode: this?.controlTypeCode ?? "",
      controlTypeId: this?.controlTypeId ?? 0,
      id: this?.id ?? 0,
      isRequired: this?.isRequired ?? false,
      lable: this?.lable ?? "",
      value: this?.value ?? "",
    );
  }
}
