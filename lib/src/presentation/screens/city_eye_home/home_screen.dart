import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/routes/routes_manager.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/show_bottom_sheet.dart';
import 'package:city_eye/src/core/utils/show_message_dialog_widget.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/events/request/submit_event_request.dart';
import 'package:city_eye/src/di/injector.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/events.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/extra_filed_events.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/get_compound_home_section.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/get_offers.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/survey.dart';
import 'package:city_eye/src/domain/entities/home/notification_count.dart';
import 'package:city_eye/src/domain/entities/sign_in/unit_list.dart';
import 'package:city_eye/src/domain/entities/sign_in/user_info.dart';
import 'package:city_eye/src/domain/usecase/get_unit_list_use_case.dart';
import 'package:city_eye/src/domain/usecase/get_user_info_use_case.dart';
import 'package:city_eye/src/presentation/blocs/cite_eye_bloc/city_eye_bloc.dart';
import 'package:city_eye/src/presentation/screens/city_eye_home/skeleton/city_eye_home_skeleton.dart';
import 'package:city_eye/src/presentation/screens/city_eye_home/utils/question_type.dart';
import 'package:city_eye/src/presentation/screens/city_eye_home/widgets/carsoul_slider_widget.dart';
import 'package:city_eye/src/presentation/screens/city_eye_home/widgets/event_bottom_sheet_widget.dart';
import 'package:city_eye/src/presentation/screens/city_eye_home/widgets/header_section_widget.dart';
import 'package:city_eye/src/presentation/screens/city_eye_home/widgets/home_event_and_survey_widget.dart';
import 'package:city_eye/src/presentation/screens/city_eye_home/widgets/home_service_widget.dart';
import 'package:city_eye/src/presentation/screens/city_eye_home/widgets/home_support_widget.dart';
import 'package:city_eye/src/presentation/screens/city_eye_home/widgets/qr_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityEyeHomeScreen extends BaseStatefulWidget {
  const CityEyeHomeScreen({super.key});

  @override
  BaseState<CityEyeHomeScreen> baseCreateState() => _CityEyeHomeScreenState();
}

class _CityEyeHomeScreenState extends BaseState<CityEyeHomeScreen> {
  UserInfo _user = const UserInfo();
  UnitLists _selectedUnitList = const UnitLists();
  final NotificationCount _notificationCount = const NotificationCount();
  List<GetOffers> _offers = [];
  GetCompoundHomeSection _getCompoundHomeSection = GetCompoundHomeSection();

  CityEyeBloc get _bloc => BlocProvider.of<CityEyeBloc>(context);
  bool _isLoadingGetOffersFinished = false;
  bool _isLoadingGetHomeSectionFinished = false;
  double _heightOfBottomSheet = 0;

  @override
  void initState() {
    _user = GetUserInfoUseCase(injector())();
    _selectedUnitList = GetUnitListUseCase(injector())();
    _bloc.add(HomeGetOfferEvent(homeCompound: "compundHome"));
    _bloc.add(HomeGetCompoundHomeSectionEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<CityEyeBloc, CityEyeState>(
      listener: (context, state) {
        if (state is HomeGetOfferStateLoading) {
        } else if (state is HomeGetCompoundHomeSectionStateLoading) {
        } else if (state is HomeGetOfferStateSuccess) {
          _offers = state.offers;
          _isLoadingGetOffersFinished = true;
        } else if (state is HomeGetCompoundHomeSectionStateSuccess) {
          _getCompoundHomeSection = state.getCompoundHomeSection;
          _isLoadingGetHomeSectionFinished = true;
        } else if (state is HomeGetOfferStateError) {
          _showDialogMessage(state.message, ImagePaths.icWarningNew);
          _isLoadingGetOffersFinished = true;
        } else if (state is HomeGetCompoundHomeSectionStateError) {
          _showDialogMessage(state.message, ImagePaths.icWarningNew);
          _isLoadingGetHomeSectionFinished = true;
        } else if (state is SubmitSurveySuccessState) {
          hideLoading();
          _getCompoundHomeSection.surveys[state.surveyIndex] = state.survey;
        } else if (state is SubmitSurveyErrorState) {
          _showDialogMessage(state.message, ImagePaths.icWarningNew);
        } else if (state is SubmitSurveyLoadingState) {
        } else if (state is HomeGetUpdateSurveyState) {
          for (int i = 0; i < _getCompoundHomeSection.surveys.length; i++) {
            if (_getCompoundHomeSection.surveys[i].id == state.surveys[i].id) {
              _getCompoundHomeSection.surveys[i] = state.surveys[i];
            }
          }
        } else if (state is SubmitEventPopState) {
          Navigator.pop(state.context);
        }
      },
      builder: (context, state) {
        if (!_isLoadingGetHomeSectionFinished || !_isLoadingGetOffersFinished) {
          return const CityEyeHomeSkeleton();
        }
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      HomeSectionWidget(
                        notificationCount: _notificationCount,
                        onNotificationTapped: () {},
                        unitLists: _selectedUnitList,
                        userInfo: _user,
                      ),
                      const SizedBox(height: 20),
                      _offers.isNotEmpty
                          ? CrasoulSliderWidget(offers: _offers)
                          : const SizedBox.shrink(),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            QrCodeWidget(
                              compoundName: _selectedUnitList.compoundName,
                            ),
                            _getCompoundHomeSection.supportCategorys.isNotEmpty
                                ? HomeSupportWidget(
                                    supportCategory: _getCompoundHomeSection
                                        .supportCategorys)
                                : const SizedBox.shrink(),
                            _getCompoundHomeSection.servicesCategorys.isNotEmpty
                                ? HomeServicesWidget(
                                    services: _getCompoundHomeSection
                                        .servicesCategorys)
                                : const SizedBox.shrink(),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                HomeEventsAndSurveyWidget(
                  getCompoundHomeSection: _getCompoundHomeSection,
                  onTapSeeAll: () async {
                    final surveys = await Navigator.pushNamed(
                      context,
                      Routes.surveyScreen,
                    );
                    _bloc.add(HomeGetUpdateSurveyEvent(
                      surveys: surveys as List<Surveys>,
                    ));
                  },
                  onTapEventOption: (
                    int eventId,
                    int optionId,
                    Events events,
                    int eventIndex,
                  ) {
                    _checkIfThisOptionHaveExtraOptions(
                      eventId: eventId,
                      optionId: optionId,
                      events: events,
                      eventIndex: eventIndex,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDialogMessage(String message, String path) {
    showMessageDialogWidget(
        context: context,
        text: message,
        icon: path,
        buttonText: S.of(context).ok,
        onTap: () {
          Navigator.pop(context);
        });
  }

  void _showBottomSheet({
    required BuildContext context,
    required List<ExtraFieldEvents> extraFieldEvents,
    required Events events,
    required int eventId,
    required int optionId,
  }) {
    showBottomSheetWidget(
      context: context,
      isDismissible: false,
      isPadding: false,
      height: (_heightOfBottomSheet + 125) + (extraFieldEvents.length * 23),
      content: EventBottomSheetWidget(
        extraFieldEvents: extraFieldEvents,
        isComeFromHome: true,
        eventId: eventId,
        optionId: optionId,
        transactionId: events.transactionId,
        event: events,
        onTapSubmit: (String massage, String path, BuildContext bottomContext,
            Events? events) {
          _heightOfBottomSheet = 0;
          if (events != null) {
            for (int i = 0; i < _getCompoundHomeSection.events.length; i++) {
              if (_getCompoundHomeSection.events[i].id == eventId) {
                for (int j = 0;
                    j < _getCompoundHomeSection.events[i].eventsOptions.length;
                    j++) {
                  if (_getCompoundHomeSection.events[i].eventsOptions[j].id ==
                      optionId) {
                    _getCompoundHomeSection.events[i].eventsOptions[j] =
                        _getCompoundHomeSection.events[i].eventsOptions[j]
                            .copyWith(
                      isSelectedByUser: true,
                    );
                  } else {
                    _getCompoundHomeSection.events[i].eventsOptions[j] =
                        _getCompoundHomeSection.events[i].eventsOptions[j]
                            .copyWith(
                      isSelectedByUser: false,
                    );
                  }
                }
              }
            }
          }
          Navigator.pop(bottomContext);
          setState(() {});
          _showDialogMessage(massage, path);
          _bloc.add(HomeGetCompoundHomeSectionEvent());
        },
      ),
      titleLabel: "",
      onClose: () {
        _heightOfBottomSheet = 0;
        Navigator.pop(context);
        _bloc.add(HomeGetCompoundHomeSectionEvent());
      },
    );
  }

  void _checkIfThisOptionHaveExtraOptions({
    required int eventId,
    required int optionId,
    required Events events,
    required int eventIndex,
  }) {
    bool isExtraFiled = false;
    bool isSelected = false;
    List<ExtraFieldEvents> extraFieldEvents = [];
    for (int j = 0;
        j < _getCompoundHomeSection.events[eventIndex].eventsOptions.length;
        j++) {
      if (_getCompoundHomeSection.events[eventIndex].eventsOptions[j].id ==
              optionId &&
          _getCompoundHomeSection
                  .events[eventIndex].eventsOptions[j].isSelectedByUser ==
              true) {
        isSelected = true;
      }
    }
    if (_getCompoundHomeSection.extraFieldEvents.isNotEmpty && !isSelected) {
      for (int i = 0;
          i < _getCompoundHomeSection.extraFieldEvents.length;
          i++) {
        if (_getCompoundHomeSection.extraFieldEvents[i].eventId == eventId &&
            _getCompoundHomeSection.extraFieldEvents[i].eventOptionId ==
                optionId) {
          extraFieldEvents.add(_getCompoundHomeSection.extraFieldEvents[i]);
          if (getQuestionType(_getCompoundHomeSection
                  .extraFieldEvents[i].controlTypeCode) ==
              QuestionType.image) {
            _heightOfBottomSheet += 200;
          } else if (getQuestionType(_getCompoundHomeSection
                      .extraFieldEvents[i].controlTypeCode) ==
                  QuestionType.text ||
              getQuestionType(_getCompoundHomeSection
                      .extraFieldEvents[i].controlTypeCode) ==
                  QuestionType.number ||
              getQuestionType(_getCompoundHomeSection
                      .extraFieldEvents[i].controlTypeCode) ==
                  QuestionType.date) {
            _heightOfBottomSheet += 115;
          } else if (getQuestionType(_getCompoundHomeSection
                      .extraFieldEvents[i].controlTypeCode) ==
                  QuestionType.singleChoice ||
              getQuestionType(_getCompoundHomeSection
                      .extraFieldEvents[i].controlTypeCode) ==
                  QuestionType.multipleChoice) {
            _heightOfBottomSheet += 90;
          }

          isExtraFiled = true;
        }
      }
    }
    if (isExtraFiled) {
      setState(() {});
      _showBottomSheet(
        context: context,
        extraFieldEvents: extraFieldEvents,
        events: events,
        eventId: eventId,
        optionId: optionId,
      );
    }
    if (!isExtraFiled && !isSelected) {
      _bloc.add(
        SubmitEventEvent(
          submitEventRequest: SubmitEventRequest(
            calendarRef: "",
            eventid: eventId,
            eventOptionId: optionId,
            transactionId: events.transactionId,
            questionAnswer: [],
          ),
        ),
      );
    }
  }
}
