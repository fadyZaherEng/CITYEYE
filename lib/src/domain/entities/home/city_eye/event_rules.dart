import 'package:equatable/equatable.dart';

class EventsRules extends Equatable {
  final int id;
  final String description;
  final int eventId;

  const EventsRules({
    this.id = 0,
    this.description = "",
    this.eventId = 0,
  });

  @override
  List<Object?> get props => [
        id,
        description,
        eventId,
      ];
}
