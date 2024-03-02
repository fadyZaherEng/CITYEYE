// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_surveys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteSurveys _$RemoteSurveysFromJson(Map<String, dynamic> json) =>
    RemoteSurveys(
      id: json['id'] as int? ?? 0,
      controlTypeId: json['controlTypeId'] as int? ?? 0,
      controlTypeCode: json['controlTypeCode'] as String? ?? "",
      lable: json['lable'] as String? ?? "",
      isRequired: json['isRequired'] as bool? ?? false,
      value: json['value'] as String? ?? "",
      answerId: json['answerId'] as String? ?? "",
      description: json['description'] as String? ?? "",
      flage: json['flage'] as bool? ?? false,
      countQuestionAnswers: json['countQuestionAnswers'] as int? ?? 0,
      startDate: json['startDate'] as String? ?? "",
      endDate: json['endDate'] as String? ?? "",
      choice: (json['choice'] as List<dynamic>?)
              ?.map((e) => Choice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      formControlsValidation: (json['formControlsValidation'] as List<dynamic>?)
              ?.map((e) =>
                  FormControlsValidation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RemoteSurveysToJson(RemoteSurveys instance) =>
    <String, dynamic>{
      'id': instance.id,
      'controlTypeId': instance.controlTypeId,
      'controlTypeCode': instance.controlTypeCode,
      'lable': instance.lable,
      'isRequired': instance.isRequired,
      'value': instance.value,
      'answerId': instance.answerId,
      'description': instance.description,
      'flage': instance.flage,
      'countQuestionAnswers': instance.countQuestionAnswers,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'choice': instance.choice,
      'formControlsValidation': instance.formControlsValidation,
    };

Choice _$ChoiceFromJson(Map<String, dynamic> json) => Choice(
      id: json['id'] as int?,
      value: json['value'] as String?,
      countAnswer: json['countAnswer'] as int?,
    );

Map<String, dynamic> _$ChoiceToJson(Choice instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'countAnswer': instance.countAnswer,
    };

FormControlsValidation _$FormControlsValidationFromJson(
        Map<String, dynamic> json) =>
    FormControlsValidation(
      id: json['id'] as int?,
      questionTypeRules: json['questionTypeRules'] == null
          ? null
          : QuestionTypeRules.fromJson(
              json['questionTypeRules'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FormControlsValidationToJson(
        FormControlsValidation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionTypeRules': instance.questionTypeRules,
    };

QuestionTypeRules _$QuestionTypeRulesFromJson(Map<String, dynamic> json) =>
    QuestionTypeRules(
      id: json['id'] as int?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$QuestionTypeRulesToJson(QuestionTypeRules instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
    };
