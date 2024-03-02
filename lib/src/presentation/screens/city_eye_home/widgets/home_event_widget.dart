import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/convert_timestamp_to_date_format.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/events.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/extra_filed_events.dart';
import 'package:city_eye/src/presentation/screens/city_eye_home/widgets/custom_button_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeEventsWidget extends StatefulWidget {
  final List<Events> events;
  final List<ExtraFieldEvents> extraFieldEvents;
  final Function(int eventId, int optionId, Events events, int eventIndex)
      onTapEventOption;

  const HomeEventsWidget({
    super.key,
    required this.events,
    required this.extraFieldEvents,
    required this.onTapEventOption,
  });

  @override
  State<HomeEventsWidget> createState() => _HomeEventsWidgetState();
}

class _HomeEventsWidgetState extends State<HomeEventsWidget> {
  bool isCanClose = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                S.of(context).Events,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorSchemes.black,
                    ),
              ),
              const Spacer(),
              Text(
                S.of(context).seeAll,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorSchemes.primary,
                    ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 165,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 165,
                  width: 331,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                        child: Container(
                          height: 165,
                          width: 331,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            color: ColorSchemes.white,
                            border: Border.all(
                              width: 1,
                              color: const Color(0xFFF1F1F1),
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16),
                            ),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.12),
                                  blurRadius: 32,
                                  spreadRadius: 0,
                                  offset: Offset(0, 4))
                            ],
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.events[index].title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: ColorSchemes.black,
                                            ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            ImagePaths.icExpiredDate,
                                            width: 24,
                                            height: 24,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            S.of(context).expDate,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    color: const Color(
                                                        0xFF989898)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            convertTimestampToDateDateFormat(
                                                widget.events[index].endDate),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                    color: ColorSchemes.black),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                const Divider(
                                  color: Color(0xFFD9D9D9),
                                  height: 1,
                                  thickness: 1.5,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: SizedBox(
                                    height: 30,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, optionIndex) {
                                        return CustomEventsButtonOptionWidget(
                                          onTap: () {
                                            widget.onTapEventOption(
                                                widget.events[index].id,
                                                widget
                                                    .events[index]
                                                    .eventsOptions[optionIndex]
                                                    .id,
                                                widget.events[index],
                                                index);
                                          },
                                          buttonTitle: widget.events[index]
                                              .eventsOptions[optionIndex].name,
                                          isSelected: widget
                                              .events[index]
                                              .eventsOptions[optionIndex]
                                              .isSelectedByUser,
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        width: 10,
                                      ),
                                      itemCount: widget
                                          .events[index].eventsOptions.length,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (!widget.events[index].isPaid)
                        Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: Container(
                            height: 20,
                            width: 45,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF39A4A),
                              borderRadius: const BorderRadiusDirectional.only(
                                topEnd: Radius.circular(16),
                              ),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFFF39A4A),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                S.of(context).Paid,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: ColorSchemes.white,
                                    ),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: widget.events.length,
            ),
          ),
        ],
      ),
    );
  }
}
