import 'package:city_eye/src/domain/entities/home/city_eye/events.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/get_compound_home_section.dart';
import 'package:city_eye/src/presentation/screens/city_eye_home/widgets/home_event_widget.dart';
import 'package:city_eye/src/presentation/screens/city_eye_home/widgets/home_survey_widget.dart';
import 'package:flutter/material.dart';

class HomeEventsAndSurveyWidget extends StatelessWidget {
  final GetCompoundHomeSection getCompoundHomeSection;
  final void Function() onTapSeeAll;
  final Function(int eventId, int optionId, Events events, int eventIndex)
      onTapEventOption;
  const HomeEventsAndSurveyWidget({
    super.key,
    required this.getCompoundHomeSection,
    required this.onTapSeeAll,
    required this.onTapEventOption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF6F6F8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            getCompoundHomeSection.events.isNotEmpty
                ? HomeEventsWidget(
                    events: getCompoundHomeSection.events,
                    extraFieldEvents: getCompoundHomeSection.extraFieldEvents,
                    onTapEventOption: onTapEventOption,
                  )
                : const SizedBox.shrink(),
            getCompoundHomeSection.surveys.isNotEmpty
                ? HomeSurveyWidget(
                    surveys: getCompoundHomeSection.surveys,
                    onTapSeeAll: onTapSeeAll,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
