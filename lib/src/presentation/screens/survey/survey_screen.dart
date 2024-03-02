import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/show_message_dialog_widget.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/survey/request/submit_survey_request.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/choice.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/survey.dart';
import 'package:city_eye/src/presentation/blocs/survey/survey_bloc.dart';
import 'package:city_eye/src/presentation/screens/survey/skeleton/survey_skeleton.dart';
import 'package:city_eye/src/presentation/screens/survey/widgets/survey_list_item_widget.dart';
import 'package:city_eye/src/presentation/widgets/build_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SurveyScreen extends BaseStatefulWidget {
  const SurveyScreen({super.key});

  @override
  BaseState<SurveyScreen> baseCreateState() => _SurveyScreenState();
}

class _SurveyScreenState extends BaseState<SurveyScreen> {
  List<Surveys> _surveys = [];

  SurveyBloc get _bloc => BlocProvider.of<SurveyBloc>(context);

  @override
  void initState() {
    _bloc.add(GetSurveyListEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<SurveyBloc, SurveyState>(
      listener: (context, state) {
        if (state is GetSurveyListSuccessState) {
          _surveys = state.surveys;
        } else if (state is SubmitSurveySuccessState) {
          hideLoading();
          _surveys[state.surveyIndex] = state.survey;
        } else if (state is SubmitSurveyErrorState) {
          hideLoading();
          _showDialogMessage(state.message);
        } else if (state is SubmitSurveyLoadingState) {
          showLoading();
        } else if (state is GetSurveyListErrorState) {
          _showDialogMessage(state.message);
        } else if (state is GetSurveyListLoadingState) {}
      },
      builder: (context, state) {
        return Scaffold(
          appBar: buildAppBarWidget(
            context,
            title: S.of(context).cityEye,
            isHaveBackButton: true,
            onBackButtonPressed: () => Navigator.pop(context, _surveys),
          ),
          body: RefreshIndicator(
            color: ColorSchemes.primary,
            onRefresh: () async => _bloc.add(GetSurveyListEvent()),
            child: _surveys.isEmpty
                ? const SurveySkeleton()
                : SafeArea(
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return SurveyListItemWidget(
                            survey: _surveys[index],
                            isSelected: _surveys[index].flage,
                            onOptionSelected: (HomeChoice option) {
                              if (!_surveys[index].flage) {
                                _bloc.add(
                                  SubmitSurveyEvent(
                                    surveyIndex: index,
                                    submitSurveyRequest: SubmitSurveyRequest(
                                      id: _surveys[index].id,
                                      answer: "",
                                      answerId: option.id.toString(),
                                      questionTypeCode:
                                          _surveys[index].controlTypeCode,
                                    ),
                                  ),
                                );
                              }
                            });
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: index == _surveys.length - 1 ? 30 : 0,
                      ),
                      itemCount: _surveys.length,
                    ),
                  ),
          ),
        );
      },
    );
  }

  void _showDialogMessage(String message) {
    showMessageDialogWidget(
        context: context,
        text: message,
        icon: ImagePaths.icWarningNew,
        buttonText: S.of(context).ok,
        onTap: () {
          Navigator.pop(context);
        });
  }
}
