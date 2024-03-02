import 'package:json_annotation/json_annotation.dart';

part 'get_qr_number_request.g.dart';

@JsonSerializable()
class GetQrNumberRequest {
  @JsonKey(name: "fromDate")
  final String? fromDate;
  @JsonKey(name: "toDate")
  final String? toDate;
  @JsonKey(name: "guestTypeId")
  final int? guestTypeId;
  @JsonKey(name: "qrTypeId")
  final int? qrTypeId;
  @JsonKey(name: "qrStatusId")
  final int? qrStatusId;

  const GetQrNumberRequest({
    this.fromDate,
    this.toDate,
    this.guestTypeId,
    this.qrTypeId,
    this.qrStatusId,
  });

  factory GetQrNumberRequest.fromJson(Map<String, dynamic> json) =>
      _$GetQrNumberRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetQrNumberRequestToJson(this);

  @override
  String toString() {
    return 'GetQrNumberRequest{fromDate: $fromDate, toDate: $toDate, guestTypeId: $guestTypeId, qrTypeId: $qrTypeId, qrStatusId: $qrStatusId}';
  }
}
