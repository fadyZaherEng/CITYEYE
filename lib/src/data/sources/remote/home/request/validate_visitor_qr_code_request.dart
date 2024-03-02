import 'package:json_annotation/json_annotation.dart';

part 'validate_visitor_qr_code_request.g.dart';

@JsonSerializable()
final class ValidateVisitorQrCodeRequest {
  final int pinCode;
  final String encryptedQr;
  const ValidateVisitorQrCodeRequest({
    required this.pinCode,
    required this.encryptedQr,
  });

  factory ValidateVisitorQrCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$ValidateVisitorQrCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateVisitorQrCodeRequestToJson(this);

  @override
  String toString() {
    return 'ValidateVisitorQrCodeRequest{pinCode: $pinCode, encryptedQr: $encryptedQr}';
  }
}
