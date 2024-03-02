import 'package:city_eye/src/domain/entities/home/city_eye/extra_filed_events.dart';
import 'package:equatable/equatable.dart';

class SubmitEvent extends Equatable {
  final int countCurrentJoin;
  final int transactionId;
  final List<ExtraFieldEvents> extraFieldEvents;

  const SubmitEvent({
    this.countCurrentJoin = 0,
    this.transactionId = 0,
    this.extraFieldEvents = const [],
  });

  @override
  List<Object?> get props => [
        countCurrentJoin,
        transactionId,
        extraFieldEvents,
      ];
}
