import 'package:json_annotation/json_annotation.dart';
part 'add_support_comment_request.g.dart';

@JsonSerializable()
final class AddSupportCommentRequest {
  final int requestId;
  final String message;
  final bool isImage;

  const AddSupportCommentRequest({
    required this.requestId,
    required this.message,
    required this.isImage,
  });

  factory AddSupportCommentRequest.fromJson(Map<String, dynamic> json) =>
      _$AddSupportCommentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddSupportCommentRequestToJson(this);
}
