import 'package:json_annotation/json_annotation.dart';

part 'submit_survey_request.g.dart';

@JsonSerializable()
class SubmitSurveyRequest {
  final int? id;
  final String? questionTypeCode;
  final String? answer;
  final String? answerId;

  const SubmitSurveyRequest({
    this.id = 0,
    this.questionTypeCode = "",
    this.answer = "",
    this.answerId = "",
  });

  factory SubmitSurveyRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitSurveyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitSurveyRequestToJson(this);
}
