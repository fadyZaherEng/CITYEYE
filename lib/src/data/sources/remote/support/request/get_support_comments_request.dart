import 'package:json_annotation/json_annotation.dart';

part 'get_support_comments_request.g.dart';

@JsonSerializable()
final class GetSupportCommentsRequest {
  final int requestId;

  const GetSupportCommentsRequest({required this.requestId});

  factory GetSupportCommentsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetSupportCommentsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetSupportCommentsRequestToJson(this);
}
