import 'package:equatable/equatable.dart';

final class SupportTechStatus extends Equatable {
  final int statusId;
  final String statusName;
  final String code;

  const SupportTechStatus({
    this.statusId = 0,
    this.statusName = "",
    this.code = "",
  });

  @override
  List<Object> get props => [statusId, statusName, code];

  SupportTechStatus copyWith({
    int? statusId,
    String? statusName,
    String? code,
  }) {
    return SupportTechStatus(
      statusId: statusId ?? this.statusId,
      statusName: statusName ?? this.statusName,
      code: code ?? this.code,
    );
  }
}
