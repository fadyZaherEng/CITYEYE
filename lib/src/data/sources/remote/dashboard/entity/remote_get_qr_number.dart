import 'package:city_eye/src/domain/entities/dashboard/get_qr_number.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_get_qr_number.g.dart';

@JsonSerializable()
class RemoteGetQrNumber {
  @JsonKey(name: "allQrNumber")
  final int? allQrNumber;
  @JsonKey(name: "cancelledQrNumber")
  final int? cancelledQrNumber;
  @JsonKey(name: "completedQrNumber")
  final int? completedQrNumber;
  @JsonKey(name: "pendingQrNumber")
  final int? pendingQrNumber;
  @JsonKey(name: "holdQrNumber")
  final int? holdQrNumber;
  @JsonKey(name: "scannedQrNumber")
  final int? scannedQrNumber;

  const RemoteGetQrNumber({
    this.allQrNumber,
    this.cancelledQrNumber,
    this.completedQrNumber,
    this.pendingQrNumber,
    this.holdQrNumber,
    this.scannedQrNumber,
  });

  factory RemoteGetQrNumber.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetQrNumberFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetQrNumberToJson(this);
}

extension RemoteGetQrNumberExtension on RemoteGetQrNumber? {
  GetQrNumber mapToDomain() => GetQrNumber(
        allQrNumber: this?.allQrNumber ?? 0,
        cancelledQrNumber: this?.cancelledQrNumber ?? 0,
        completedQrNumber: this?.completedQrNumber ?? 0,
        pendingQrNumber: this?.pendingQrNumber ?? 0,
        holdQrNumber: this?.holdQrNumber ?? 0,
        scannedQrNumber: this?.scannedQrNumber ?? 0,
      );
}
