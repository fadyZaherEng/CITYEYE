import 'package:json_annotation/json_annotation.dart';

part 'get_support_request.g.dart';

@JsonSerializable()
class GetSupportRequest {
  @JsonKey(name: "fromDate")
  final String? fromDate;
  @JsonKey(name: "toDate")
  final String? toDate;
  @JsonKey(name: "supportStatusId")
  final int? supportStatusId;

  const GetSupportRequest({
    this.fromDate,
    this.toDate,
    this.supportStatusId,
  });

  factory GetSupportRequest.fromJson(Map<String, dynamic> json) =>
      _$GetSupportRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetSupportRequestToJson(this);
  @override
  String toString() {
    return "$fromDate $toDate $supportStatusId";
  }
}
