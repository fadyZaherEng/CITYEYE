import 'package:equatable/equatable.dart';

class GetCompoundLast5DayCashFlow extends Equatable {
  final String date;
  final int paidAmounts;

  const GetCompoundLast5DayCashFlow({
    this.date = '',
    this.paidAmounts = 0,
  });

  @override
  List<Object?> get props => [
        date,
        paidAmounts,
      ];
}
