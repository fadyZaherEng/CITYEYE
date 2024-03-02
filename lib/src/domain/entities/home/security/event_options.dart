import 'package:equatable/equatable.dart';

class EventsOptions extends Equatable {
  final int id;
  final String name;
  final int eventId;
  final bool isCalendar;
  final bool isSelectedByUser;

  const EventsOptions({
    this.id = 0,
    this.name = '',
    this.eventId = 0,
    this.isCalendar = false,
    this.isSelectedByUser = false,
  });

  @override
  List<Object?> get props => [id, name, eventId, isCalendar, isSelectedByUser];
}
