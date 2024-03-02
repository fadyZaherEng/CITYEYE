import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/survey/request/submit_survey_request.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/choice.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/survey.dart';
import 'package:city_eye/src/presentation/blocs/cite_eye_bloc/city_eye_bloc.dart';
import 'package:city_eye/src/presentation/screens/city_eye_home/widgets/survey_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSurveyWidget extends StatefulWidget {
  final List<Surveys> surveys;
  final void Function() onTapSeeAll;

  const HomeSurveyWidget({
    super.key,
    required this.surveys,
    required this.onTapSeeAll,
  });

  @override
  State<HomeSurveyWidget> createState() => _HomeSurveyWidgetState();
}

class _HomeSurveyWidgetState extends State<HomeSurveyWidget> {
  CityEyeBloc get _bloc => BlocProvider.of<CityEyeBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                S.of(context).Surveys,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorSchemes.black,
                    ),
              ),
              const Spacer(),
              InkWell(
                onTap: widget.onTapSeeAll,
                child: Text(
                  S.of(context).seeAll,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ColorSchemes.primary,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 370,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SurveyListItemWidget(
                  survey: widget.surveys[index],
                  isSelected: widget.surveys[index].flage,
                  onOptionSelected: (HomeChoice option) {
                    if (!widget.surveys[index].flage) {
                      _bloc.add(
                        SubmitSurveyEvent(
                          surveyIndex: index,
                          submitSurveyRequest: SubmitSurveyRequest(
                            id: widget.surveys[index].id,
                            answer: "",
                            answerId: option.id.toString(),
                            questionTypeCode:
                                widget.surveys[index].controlTypeCode,
                          ),
                        ),
                      );
                    }
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              itemCount: widget.surveys.length,
            ),
          ),
        ],
      ),
    );
  }
}
