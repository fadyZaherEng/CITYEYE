import 'package:json_annotation/json_annotation.dart';

part 'qr_code_details_request.g.dart';

@JsonSerializable()
final class QrCodeDetailsRequest {
  final int qrId;
  final int pinCode;

  const QrCodeDetailsRequest({
    required this.qrId,
    required this.pinCode,
  });

  factory QrCodeDetailsRequest.fromJson(Map<String, dynamic> json) =>
      _$QrCodeDetailsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$QrCodeDetailsRequestToJson(this);

  @override
  String toString() {
    return 'QrCodeDetailsRequest{qrId: $qrId , pinCode: $pinCode}';
  }
}
