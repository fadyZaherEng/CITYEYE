import 'package:equatable/equatable.dart';

class OwnerExtraField extends Equatable {
  final int id;
  final int controlTypeId;
  final String controlTypeCode;
  final String lable;
  final bool isRequired;
  final String value;
  final List<dynamic> choice;
  final List<dynamic> formControlsValidation;

  const OwnerExtraField({
    this.id = 0,
    this.controlTypeId = 0,
    this.controlTypeCode = "",
    this.lable = "",
    this.isRequired = false,
    this.value = "",
    this.choice = const [],
    this.formControlsValidation = const [],
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
