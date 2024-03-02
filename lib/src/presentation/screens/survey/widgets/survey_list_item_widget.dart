import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/convert_timestamp_to_date_format.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/choice.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/survey.dart';
import 'package:city_eye/src/presentation/screens/survey/widgets/custom_button_option_widget.dart';
import 'package:city_eye/src/presentation/widgets/compare_diagram_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SurveyListItemWidget extends StatelessWidget {
  final Surveys survey;
  final bool isSelected;
  final Function(HomeChoice) onOptionSelected;

  const SurveyListItemWidget({
    super.key,
    required this.survey,
    required this.isSelected,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Container(
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
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  survey.lable,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: const Color(0xFF222222),
                                      ),
                                ),
                                const SizedBox(
                                  height: 5,
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
                                              color: const Color(0xFF989898)),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      convertTimestampToDateDateFormat(
                                          survey.endDate),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: const Color(0xFF222222)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Color(0xFFD9D9D9),
                            height: 1,
                            thickness: 1.5,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              height: 30,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, optionIndex) {
                                  return CustomEventsButtonOptionWidget(
                                    onTap: () {
                                      onOptionSelected(
                                          survey.choice[optionIndex]);
                                    },
                                    buttonTitle:
                                        survey.choice[optionIndex].value,
                                    isSelected: isSelected &&
                                        survey.value ==
                                            survey.choice[optionIndex].id
                                                .toString(),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: 10,
                                ),
                                itemCount: survey.choice.length,
                              ),
                            ),
                          ),
                          if (survey.choice.isNotEmpty && isSelected)
                            Wrap(
                              children: [
                                SizedBox(
                                  child: Wrap(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: CompareDiagramWidget(
                                          choice: survey.choice,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
