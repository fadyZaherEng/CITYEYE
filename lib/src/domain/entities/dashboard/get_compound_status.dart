import 'package:equatable/equatable.dart';

class GetCompoundAllUserStatus extends Equatable {
  final int active;
  final int pending;
  final int notActive;

  const GetCompoundAllUserStatus({
    this.active = 0,
    this.pending = 0,
    this.notActive = 0,
  });

  @override
  List<Object?> get props => [active, pending, notActive];
}
