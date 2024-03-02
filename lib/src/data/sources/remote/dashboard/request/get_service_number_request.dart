import 'package:json_annotation/json_annotation.dart';

part 'get_service_number_request.g.dart';

@JsonSerializable()
class GetServiceNumberRequest {
  @JsonKey(name: "fromDate")
  final String? fromDate;
  @JsonKey(name: "toDate")
  final String? toDate;
  @JsonKey(name: "serviceStatusId")
  final int? serviceStatusId;
  @JsonKey(name: "categoryId")
  final int? categoryId;

  const GetServiceNumberRequest({
    this.fromDate,
    this.toDate,
    this.serviceStatusId,
    this.categoryId,
  });

  factory GetServiceNumberRequest.fromJson(Map<String, dynamic> json) =>
      _$GetServiceNumberRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetServiceNumberRequestToJson(this);
}
