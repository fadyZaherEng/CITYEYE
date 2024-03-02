import 'package:city_eye/src/domain/entities/home/city_eye/event_option.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/event_rules.dart';
import 'package:equatable/equatable.dart';

class Events extends Equatable {
  final int id;
  final String title;
  final String description;
  final String startDate;
  final String endDate;
  final String openingDate;
  final String closedDate;
  final bool isPaid;
  final int maxCountJoin;
  final int memberCount;
  final String locationAddress;
  final String locationLatitude;
  final String locationLongitude;
  final int transactionId;
  final List<EventsOptions> eventsOptions;
  final List<EventsRules> eventsRules;
  final List<dynamic> eventsAttachments;

  const Events({
    this.id = 0,
    this.title = "",
    this.description = "",
    this.startDate = "",
    this.endDate = "",
    this.openingDate = "",
    this.closedDate = "",
    this.isPaid = false,
    this.maxCountJoin = 0,
    this.memberCount = 0,
    this.locationAddress = "",
    this.locationLatitude = "",
    this.locationLongitude = "",
    this.transactionId = 0,
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
        openingDate,
        closedDate,
        isPaid,
        maxCountJoin,
        memberCount,
        locationAddress,
        locationLatitude,
        locationLongitude,
        transactionId,
        eventsOptions,
        eventsRules,
        eventsAttachments,
      ];

  Events copyWith({
    int? id,
    String? title,
    String? description,
    String? startDate,
    String? endDate,
    String? openingDate,
    String? closedDate,
    bool? isPaid,
    int? maxCountJoin,
    int? memberCount,
    String? locationAddress,
    String? locationLatitude,
    String? locationLongitude,
    int? transactionId,
    List<EventsOptions>? eventsOptions,
    List<EventsRules>? eventsRules,
    List<dynamic>? eventsAttachments,
  }) {
    return Events(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      openingDate: openingDate ?? this.openingDate,
      closedDate: closedDate ?? this.closedDate,
      isPaid: isPaid ?? this.isPaid,
      maxCountJoin: maxCountJoin ?? this.maxCountJoin,
      memberCount: memberCount ?? this.memberCount,
      locationAddress: locationAddress ?? this.locationAddress,
      locationLatitude: locationLatitude ?? this.locationLatitude,
      locationLongitude: locationLongitude ?? this.locationLongitude,
      transactionId: transactionId ?? this.transactionId,
      eventsOptions: eventsOptions ?? this.eventsOptions,
      eventsRules: eventsRules ?? this.eventsRules,
      eventsAttachments: eventsAttachments ?? this.eventsAttachments,
    );
  }
}
