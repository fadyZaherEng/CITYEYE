import 'package:city_eye/src/domain/entities/dashboard/get_support_number.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_get_support_number.g.dart';

@JsonSerializable()
class RemoteGetSupportNumber {
  @JsonKey(name: 'numberOfAllSupportRequests')
  final int? numberOfAllSupportRequests;
  @JsonKey(name: 'numberOfPendingRequests')
  final int? numberOfPendingRequests;
  @JsonKey(name: 'numberOfProgressRequests')
  final int? numberOfProgressRequests;
  @JsonKey(name: 'numberOfCompletedRequests')
  final int? numberOfCompletedRequests;
  @JsonKey(name: 'numberOfCancelledRequests')
  final int? numberOfCancelledRequests;
  @JsonKey(name: 'numberOfHoldRequests')
  final int? numberOfHoldRequests;
  @JsonKey(name: 'numberOfNeedPaymentRequests')
  final int? numberOfNeedPaymentRequests;

  const RemoteGetSupportNumber({
    this.numberOfAllSupportRequests,
    this.numberOfPendingRequests,
    this.numberOfProgressRequests,
    this.numberOfCompletedRequests,
    this.numberOfCancelledRequests,
    this.numberOfHoldRequests,
    this.numberOfNeedPaymentRequests,
  });

  factory RemoteGetSupportNumber.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetSupportNumberFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetSupportNumberToJson(this);
  String toString() {
    return "$numberOfAllSupportRequests $numberOfPendingRequests $numberOfProgressRequests $numberOfCompletedRequests $numberOfCancelledRequests $numberOfHoldRequests $numberOfNeedPaymentRequests";
  }
}

extension RemoteGetSupportNumberExtension on RemoteGetSupportNumber? {
  GetSupportNumber mapToDomain() => GetSupportNumber(
        numberOfAllSupportRequests: this?.numberOfAllSupportRequests ?? 0,
        numberOfPendingRequests: this?.numberOfPendingRequests ?? 0,
        numberOfProgressRequests: this?.numberOfProgressRequests ?? 0,
        numberOfCompletedRequests: this?.numberOfCompletedRequests ?? 0,
        numberOfCancelledRequests: this?.numberOfCancelledRequests ?? 0,
        numberOfHoldRequests: this?.numberOfHoldRequests ?? 0,
        numberOfNeedPaymentRequests: this?.numberOfNeedPaymentRequests ?? 0,
      );
}
