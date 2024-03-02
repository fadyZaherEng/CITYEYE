import 'package:city_eye/src/domain/entities/home/choice.dart';
import 'package:equatable/equatable.dart';

class ExtraFieldEvents extends Equatable {
  final int eventId;
  final int eventOptionId;
  final int id;
  final int controlTypeId;
  final String controlTypeCode;
  final String lable;
  final bool isRequired;
  final String description;
  final List<Choice> choice;
  String value;
  final List<dynamic> formControlsValidation;

  ExtraFieldEvents({
    this.eventId = 0,
    this.eventOptionId = 0,
    this.id = 0,
    this.controlTypeId = 0,
    this.controlTypeCode = "",
    this.lable = "",
    this.isRequired = false,
    this.description = "",
    this.choice = const [],
    this.formControlsValidation = const [],
    this.value = "",
  });

  @override
  List<Object?> get props => [
        eventId,
        eventOptionId,
        id,
        controlTypeId,
        controlTypeCode,
        lable,
        isRequired,
        description,
        choice,
        formControlsValidation,
      ];

  ExtraFieldEvents copyWith({
    int? eventId,
    int? eventOptionId,
    int? id,
    int? controlTypeId,
    String? controlTypeCode,
    String? lable,
    bool? isRequired,
    String? description,
    List<Choice>? choice,
    String? value,
    List<dynamic>? formControlsValidation,
  }) {
    return ExtraFieldEvents(
      eventId: eventId ?? this.eventId,
      eventOptionId: eventOptionId ?? this.eventOptionId,
      id: id ?? this.id,
      controlTypeId: controlTypeId ?? this.controlTypeId,
      controlTypeCode: controlTypeCode ?? this.controlTypeCode,
      lable: lable ?? this.lable,
      isRequired: isRequired ?? this.isRequired,
      description: description ?? this.description,
      choice: choice ?? this.choice,
      value: value ?? this.value,
      formControlsValidation:
          formControlsValidation ?? this.formControlsValidation,
    );
  }
}
