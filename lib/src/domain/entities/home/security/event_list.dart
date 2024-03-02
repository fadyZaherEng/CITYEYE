import 'package:city_eye/src/domain/entities/home/security/events.dart';
import 'package:city_eye/src/domain/entities/home/security/extra_filed_events.dart';
import 'package:equatable/equatable.dart';

class EventList extends Equatable {
  final List<Events> events;
  final List<ExtraFieldEvents> extraFieldEvents;

  const EventList({
    this.events = const [],
    this.extraFieldEvents = const [],
  });

  @override
  List<Object?> get props => [events, extraFieldEvents];
}
