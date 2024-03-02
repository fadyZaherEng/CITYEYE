import 'package:city_eye/src/domain/entities/dashboard/get_compound_last_five_day_cash_flow.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_get_compound_last5_day_cash_flow.g.dart';

@JsonSerializable()
class RemoteGetCompoundLast5DayCashFlow {
  final String? date;
  final int? paidAmounts;

  const RemoteGetCompoundLast5DayCashFlow({
    this.date,
    this.paidAmounts,
  });

  factory RemoteGetCompoundLast5DayCashFlow.fromJson(
          Map<String, dynamic> json) =>
      _$RemoteGetCompoundLast5DayCashFlowFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoteGetCompoundLast5DayCashFlowToJson(this);
  @override
  String toString() {
    return "$date $paidAmounts";
  }
}

extension RemoteGetCompoundLast5DayCashFlowExtension
    on RemoteGetCompoundLast5DayCashFlow {
  GetCompoundLast5DayCashFlow toDomain() {
    return GetCompoundLast5DayCashFlow(
      date: date ?? '',
      paidAmounts: paidAmounts ?? 0,
    );
  }
}

extension GetCompoundLast5DayCashFlowListExtension
    on List<RemoteGetCompoundLast5DayCashFlow>? {
  List<GetCompoundLast5DayCashFlow> toDomain() {
    return this?.map((e) => e.toDomain()).toList() ?? [];
  }
}
