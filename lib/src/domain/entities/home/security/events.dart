import 'package:city_eye/src/domain/entities/home/security/event_options.dart';
import 'package:city_eye/src/domain/entities/home/security/event_rules.dart';
import 'package:equatable/equatable.dart';

class Events extends Equatable {
  final int id;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final bool isPaid;
  final int maxCountJoin;
  final int memberCount;
  final int memberPrice;
  final String locationAddress;
  final String locationLatitude;
  final String locationLongitude;
  final int transactionId;
  final String calendarRef;
  final List<EventsOptions> eventsOptions;
  final List<EventsRules> eventsRules;
  final List<dynamic> eventsAttachments;

  const Events({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.startDate = '',
    this.endDate = '',
    this.isPaid = false,
    this.maxCountJoin = 0,
    this.memberCount = 0,
    this.memberPrice = 0,
    this.locationAddress = '',
    this.locationLatitude = '',
    this.locationLongitude = '',
    this.transactionId = 0,
    this.calendarRef = '',
    this.eventsOptions = const [],
    this.eventsRules = const [],
    this.eventsAttachments = const [],
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        startDate,
        endDate,
        isPaid,
        maxCountJoin,
        memberCount,
        memberPrice,
        locationAddress,
        locationLatitude,
        locationLongitude,
        transactionId,
        calendarRef,
        eventsOptions,
        eventsRules,
        eventsAttachments,
      ];
}
