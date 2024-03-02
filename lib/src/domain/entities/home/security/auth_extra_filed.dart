import 'package:equatable/equatable.dart';

class AuthExtraField extends Equatable {
  final int id;
  final int controlTypeId;
  final String controlTypeCode;
  final String lable;
  final bool isRequired;
  final String value;
  final List<dynamic>? choice;
  final List<dynamic>? formControlsValidation;

  const AuthExtraField({
    this.id = 0,
    this.controlTypeId = 0,
    this.controlTypeCode = "",
    this.lable = "",
    this.isRequired = false,
    this.value = "",
    this.choice,
    this.formControlsValidation,
  });

  @override
  List<Object?> get props => [
        id,
        controlTypeId,
        controlTypeCode,
        lable,
        isRequired,
        value,
        choice,
        formControlsValidation
      ];
}
