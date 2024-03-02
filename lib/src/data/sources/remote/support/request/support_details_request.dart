import 'package:json_annotation/json_annotation.dart';
part 'support_details_request.g.dart';

@JsonSerializable()
final class SupportDetailsRequest {
  final int requestId;

  const SupportDetailsRequest({required this.requestId});

  factory SupportDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$SupportDetailsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SupportDetailsRequestToJson(this);
}
