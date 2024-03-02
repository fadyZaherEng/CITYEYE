// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_survey_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitSurveyRequest _$SubmitSurveyRequestFromJson(Map<String, dynamic> json) =>
    SubmitSurveyRequest(
      id: json['id'] as int? ?? 0,
      questionTypeCode: json['questionTypeCode'] as String? ?? "",
      answer: json['answer'] as String? ?? "",
      answerId: json['answerId'] as String? ?? "",
    );

Map<String, dynamic> _$SubmitSurveyRequestToJson(
        SubmitSurveyRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionTypeCode': instance.questionTypeCode,
      'answer': instance.answer,
      'answerId': instance.answerId,
    };
