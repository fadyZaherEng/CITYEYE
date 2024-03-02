import 'package:city_eye/src/domain/entities/support/support_tech_status.dart';
import 'package:json_annotation/json_annotation.dart';
part 'remote_support_tech_status.g.dart';

@JsonSerializable()
final class RemoteSupportTechStatus {
  final int? statusId;
  final String? statusName;
  final String? code;

  const RemoteSupportTechStatus({
    this.statusId = 0,
    this.statusName = "",
    this.code = "",
  });

  factory RemoteSupportTechStatus.fromJson(Map<String, dynamic> json) =>
      _$RemoteSupportTechStatusFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteSupportTechStatusToJson(this);
}

extension RemoteSupportTechStatusExtension on RemoteSupportTechStatus? {
  SupportTechStatus mapToDomain() => SupportTechStatus(
        statusId: this?.statusId ?? 0,
        statusName: this?.statusName ?? "",
        code: this?.code ?? "",
      );
}
