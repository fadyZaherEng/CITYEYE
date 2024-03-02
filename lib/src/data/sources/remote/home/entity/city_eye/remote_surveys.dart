import 'package:city_eye/src/domain/entities/home/city_eye/choice.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/from_control_validation.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/home_question_type_rules.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/survey.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_surveys.g.dart';

@JsonSerializable()
class RemoteSurveys {
  final int? id;
  final int? controlTypeId;
  final String? controlTypeCode;
  final String? lable;
  final bool? isRequired;
  final String? value;
  final String? answerId;
  final String? description;
  final bool? flage;
  final int? countQuestionAnswers;
  final String? startDate;
  final String? endDate;
  final List<Choice>? choice;
  final List<FormControlsValidation>? formControlsValidation;

  const RemoteSurveys({
    this.id = 0,
    this.controlTypeId = 0,
    this.controlTypeCode = "",
    this.lable = "",
    this.isRequired = false,
    this.value = "",
    this.answerId = "",
    this.description = "",
    this.flage = false,
    this.countQuestionAnswers = 0,
    this.startDate = "",
    this.endDate = "",
    this.choice = const [],
    this.formControlsValidation = const [],
  });

  factory RemoteSurveys.fromJson(Map<String, dynamic> json) =>
      _$RemoteSurveysFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteSurveysToJson(this);
}

@JsonSerializable()
class Choice {
  final int? id;
  final String? value;
  final int? countAnswer;

  const Choice({
    this.id,
    this.value,
    this.countAnswer,
  });

  factory Choice.fromJson(Map<String, dynamic> json) => _$ChoiceFromJson(json);

  Map<String, dynamic> toJson() => _$ChoiceToJson(this);
}

@JsonSerializable()
class FormControlsValidation {
  final int? id;
  final QuestionTypeRules? questionTypeRules;

  const FormControlsValidation({
    this.id,
    this.questionTypeRules,
  });

  factory FormControlsValidation.fromJson(Map<String, dynamic> json) =>
      _$FormControlsValidationFromJson(json);

  Map<String, dynamic> toJson() => _$FormControlsValidationToJson(this);
}

@JsonSerializable()
class QuestionTypeRules {
  final int? id;
  final String? code;

  const QuestionTypeRules({
    this.id,
    this.code,
  });

  factory QuestionTypeRules.fromJson(Map<String, dynamic> json) =>
      _$QuestionTypeRulesFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionTypeRulesToJson(this);
}

extension RemoteSurveysExtension on RemoteSurveys? {
  Surveys mapToDomain() => Surveys(
        id: this?.id ?? 0,
        controlTypeId: this?.controlTypeId ?? 0,
        controlTypeCode: this?.controlTypeCode ?? "",
        lable: this?.lable ?? "",
        isRequired: this?.isRequired ?? false,
        value: this?.value ?? "",
        answerId: this?.answerId ?? "",
        description: this?.description ?? "",
        flage: this?.flage ?? false,
        countQuestionAnswers: this?.countQuestionAnswers ?? 0,
        startDate: this?.startDate ?? "",
        endDate: this?.endDate ?? "",
        choice: this?.choice?.map((e) => e.mapToDomain()).toList() ?? [],
        formControlsValidation: this
                ?.formControlsValidation
                ?.map((e) => e.mapToDomain())
                .toList() ??
            [],
      );
}

extension RemoteSurveyListExtension on List<RemoteSurveys>? {
  List<Surveys> toDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}

extension ChoiceExtension on Choice? {
  HomeChoice mapToDomain() => HomeChoice(
        id: this?.id ?? 0,
        value: this?.value ?? "",
        countAnswer: this?.countAnswer ?? 0,
      );
}

extension QuestionTypeRulesExtension on QuestionTypeRules? {
  HomeQuestionTypeRules mapToDomain() => HomeQuestionTypeRules(
        id: this?.id ?? 0,
        code: this?.code ?? "",
      );
}

extension FormControlsValidationExtension on FormControlsValidation? {
  HomeFormControlsValidation mapToDomain() => HomeFormControlsValidation(
        id: this?.id ?? 0,
        questionTypeRules: this?.questionTypeRules?.mapToDomain() ??
            const HomeQuestionTypeRules(),
      );
}
