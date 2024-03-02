import 'package:city_eye/src/domain/entities/home/city_eye/events.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/extra_filed_events.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/home_section.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/service_category.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/support_category.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/survey.dart';
import 'package:equatable/equatable.dart';

class GetCompoundHomeSection extends Equatable {
  final List<HomeSection> homeSections;
  final List<SupportCategory> supportCategorys;
  final List<ServicesCategory> servicesCategorys;
  final List<Events> events;
  List<Surveys> surveys;
  final List<ExtraFieldEvents> extraFieldEvents;

  GetCompoundHomeSection({
    this.homeSections = const [],
    this.supportCategorys = const [],
    this.servicesCategorys = const [],
    this.events = const [],
    this.surveys = const [],
    this.extraFieldEvents = const [],
  });

  @override
  List<Object?> get props => [
        homeSections,
        supportCategorys,
        servicesCategorys,
        events,
        surveys,
        extraFieldEvents,
      ];
}
