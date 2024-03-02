import 'package:equatable/equatable.dart';

final class SupportUserUnits extends Equatable {
  final int unitId;
  final int unitNumber;
  final String name;

  const SupportUserUnits({
    this.unitId = 0,
    this.unitNumber =0,
    this.name = "",
  });

  @override
  List<Object> get props => [unitId, unitNumber, name];

  SupportUserUnits copyWith({
    int? unitId,
    int? unitNumber,
    String? name,
  }) {
    return SupportUserUnits(
      unitId: unitId ?? this.unitId,
      unitNumber: unitNumber ?? this.unitNumber,
      name: name ?? this.name,
    );
  }
}
