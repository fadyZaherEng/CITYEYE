import 'package:equatable/equatable.dart';

class EventsOptions extends Equatable {
  final int id;
  final String name;
  final int eventId;
  final bool isJoin;
  final bool isCalendar;
  final bool isSelectedByUser;

  const EventsOptions({
    this.id = 0,
    this.name = "",
    this.eventId = 0,
    this.isJoin = false,
    this.isCalendar = false,
    this.isSelectedByUser = false,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        eventId,
        isJoin,
        isCalendar,
        isSelectedByUser,
      ];

  EventsOptions copyWith({
    int? id,
    String? name,
    int? eventId,
    bool? isJoin,
    bool? isCalendar,
    bool? isSelectedByUser,
  }) {
    return EventsOptions(
      id: id ?? this.id,
      name: name ?? this.name,
      eventId: eventId ?? this.eventId,
      isJoin: isJoin ?? this.isJoin,
      isCalendar: isCalendar ?? this.isCalendar,
      isSelectedByUser: isSelectedByUser ?? this.isSelectedByUser,
    );
  }
}
