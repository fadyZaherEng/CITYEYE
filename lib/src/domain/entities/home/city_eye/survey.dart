import 'package:city_eye/src/domain/entities/home/city_eye/choice.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/from_control_validation.dart';
import 'package:equatable/equatable.dart';

class Surveys extends Equatable {
  final int id;
  final int controlTypeId;
  final String controlTypeCode;
  final String lable;
  final bool isRequired;
  final String description;
  final bool flage;
  final String value;
  final String answerId;
  final int countQuestionAnswers;
  final String startDate;
  final String endDate;
  final List<HomeChoice> choice;
  final List<HomeFormControlsValidation> formControlsValidation;

  const Surveys({
    this.id = 0,
    this.controlTypeId = 0,
    this.value = "",
    this.answerId = "",
    this.controlTypeCode = "",
    this.lable = "",
    this.isRequired = false,
    this.description = "",
    this.flage = false,
    this.countQuestionAnswers = 0,
    this.startDate = "",
    this.endDate = "",
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
        description,
        flage,
        countQuestionAnswers,
        startDate,
        endDate,
        choice,
        formControlsValidation,
        value,
        answerId
      ];
}
