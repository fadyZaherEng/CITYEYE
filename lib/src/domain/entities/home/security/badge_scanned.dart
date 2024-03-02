import 'package:city_eye/src/domain/entities/home/security/badge.dart';
import 'package:city_eye/src/domain/entities/home/security/event_list.dart';
import 'package:city_eye/src/domain/entities/home/security/service.dart';
import 'package:equatable/equatable.dart';

class BadgeScanned extends Equatable {
  final Badge badge;
  final List<Services> services;
  final EventList eventList;

  const BadgeScanned({
    this.badge = const Badge(),
    this.services = const [],
    this.eventList = const EventList(),
  });

  @override
  List<Object?> get props => [badge, services, eventList];
}
