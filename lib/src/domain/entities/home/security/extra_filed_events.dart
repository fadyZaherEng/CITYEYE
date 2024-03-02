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
  final List<dynamic> choice;
  final List<dynamic> formControlsValidation;

  const ExtraFieldEvents({
    this.eventId = 0,
    this.eventOptionId = 0,
    this.id = 0,
    this.controlTypeId = 0,
    this.controlTypeCode = '',
    this.lable = '',
    this.isRequired = false,
    this.description = '',
    this.choice = const [],
    this.formControlsValidation = const [],
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
      ];
}
