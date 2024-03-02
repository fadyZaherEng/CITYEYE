import 'package:json_annotation/json_annotation.dart';

part 'get_lock_up_data_rows_request.g.dart';

@JsonSerializable()
class GetLockUpDataRowsRequest {
  final String? lookupCode;

  const GetLockUpDataRowsRequest({
    this.lookupCode,
  });

  factory GetLockUpDataRowsRequest.fromJson(Map<String, dynamic> json) =>
      _$GetLockUpDataRowsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetLockUpDataRowsRequestToJson(this);
}
