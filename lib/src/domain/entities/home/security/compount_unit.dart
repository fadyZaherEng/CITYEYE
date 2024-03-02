import 'package:equatable/equatable.dart';

class CompoundUnits extends Equatable {
  final int id;
  final String name;
  final String unitNO;

  const CompoundUnits({
    this.id = 0,
    this.name = "",
    this.unitNO = "",
  });

  @override
  List<Object?> get props => [id, name, unitNO];
}
