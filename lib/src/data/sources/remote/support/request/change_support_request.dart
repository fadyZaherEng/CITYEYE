import 'package:json_annotation/json_annotation.dart';

part 'change_support_request.g.dart';

@JsonSerializable()
final class ChangeSupportRequest {
  final int requestId;
  final String statusCode;
  final double totalAmount;
  final String description;

  const ChangeSupportRequest({
    required this.requestId,
    required this.statusCode,
    required this.totalAmount,
    required this.description,
  });

  factory ChangeSupportRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangeSupportRequestFromJson(json);

  @override
  String toString() {
    return 'ChangeSupportRequest{requestId: $requestId, statusCode: $statusCode}';
  }

  Map<String, dynamic> toJson() => _$ChangeSupportRequestToJson(this);
}
