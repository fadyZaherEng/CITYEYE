import 'package:city_eye/src/data/sources/remote/home/entity/events/request/event_question_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'submit_event_request.g.dart';

@JsonSerializable()
final class SubmitEventRequest {
  final int eventid;
  final int eventOptionId;
  final int transactionId;
  final String calendarRef;
  final List<EventQuestionRequest> questionAnswer;

  const SubmitEventRequest({
    this.eventid = 0,
    this.eventOptionId = 0,
    this.transactionId = 0,
    this.calendarRef = '',
    this.questionAnswer = const [],
  });

  factory SubmitEventRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitEventRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitEventRequestToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'eventid': eventid,
      'eventOptionId': eventOptionId,
      'transactionId': transactionId,
      'calendarRef': calendarRef,
      'questionAnswer':
          questionAnswer.map((question) => question.toMap()).toList(),
    };
  }

  factory SubmitEventRequest.fromMap(Map<String, dynamic> map) {
    return SubmitEventRequest(
      eventid: map['eventid'] as int,
      eventOptionId: map['eventOptionId'] as int,
      transactionId: map['transactionId'] as int,
      calendarRef: map['calendarRef'] as String,
      questionAnswer: map['questionAnswer'] as List<EventQuestionRequest>,
    );
  }
  @override
  String toString() {
    return 'eventid: $eventid, eventOptionId: $eventOptionId, transactionId: $transactionId, calendarRef: $calendarRef, questionAnswer: $questionAnswer';
  }
}
