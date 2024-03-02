// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:city_eye/generated/l10n.dart';
import 'package:city_eye/src/config/theme/color_schemes.dart';
import 'package:city_eye/src/core/base/widget/base_stateful_widget.dart';
import 'package:city_eye/src/core/resources/image_paths.dart';
import 'package:city_eye/src/core/utils/show_message_dialog_widget.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/events/request/event_question_request.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/events/request/submit_event_request.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/events.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/extra_filed_events.dart';
import 'package:city_eye/src/presentation/blocs/event_question/event_question_bloc.dart';
import 'package:city_eye/src/presentation/screens/city_eye_home/utils/question_type.dart';
import 'package:city_eye/src/presentation/screens/city_eye_home/widgets/build_question_widget.dart';
import 'package:city_eye/src/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventBottomSheetWidget extends BaseStatefulWidget {
  final List<ExtraFieldEvents> extraFieldEvents;
  final int eventId;
  final int optionId;
  final int transactionId;
  final Events event;
  bool isComeFromHome;
  final Function(String, String, BuildContext, Events?) onTapSubmit;

  EventBottomSheetWidget({
    super.key,
    required this.extraFieldEvents,
    required this.eventId,
    required this.optionId,
    required this.transactionId,
    required this.onTapSubmit,
    required this.event,
    required this.isComeFromHome,
  });

  @override
  BaseState<EventBottomSheetWidget> baseCreateState() =>
      _EventBottomSheetWidgetState();
}

class _EventBottomSheetWidgetState extends BaseState<EventBottomSheetWidget> {
  EventQuestionBloc get _bloc => BlocProvider.of<EventQuestionBloc>(context);
  List<EventQuestionRequest> questionAnswer = [];
  Map<String, File> multiMedia = {};
  bool isValidate = false;

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<EventQuestionBloc, EventQuestionState>(
      listener: (context, state) {
        if (state is SubmitEventSuccessState) {
          hideLoading();
          widget.onTapSubmit(
              state.message, ImagePaths.icSuccessNew, context, state.event);
        } else if (state is SubmitEventErrorState) {
          hideLoading();
          _showMessageDialog(state.message, ImagePaths.icWarningNew);
          // widget.onTapSubmitRefresh(
          //     state.message, ImagePaths.icWarningNew, context);
        } else if (state is SubmitEventValidateState) {
          for (var element in widget.extraFieldEvents) {
            if (element.id == state.extraFieldEvents.id) {
              element.value = state.extraFieldEvents.value;
            }
          }
          if (state.imageName != null) {
            multiMedia[state.imageName!] = state.file!;
          }
        } else if (state is SubmitEventRefreshState) {
          isValidate = _validate();
          widget.isComeFromHome = false;
          if (isValidate) {
            showLoading();
            for (var element in widget.extraFieldEvents) {
              questionAnswer.add(
                EventQuestionRequest(
                  id: element.id,
                  controlTypeId: element.controlTypeId,
                  controlTypeCode: element.controlTypeCode,
                  lable: element.lable,
                  isRequired: element.isRequired,
                  value: element.value,
                  answerId: "",
                ),
              );
            }
            _bloc.add(
              SubmitEventEvent(
                submitEventRequest: SubmitEventRequest(
                  eventid: widget.eventId,
                  eventOptionId: widget.optionId,
                  transactionId: widget.transactionId,
                  calendarRef: "",
                  questionAnswer: questionAnswer,
                ),
                files: multiMedia,
                event: widget.event,
              ),
            );
          }
        } else if (state is SubmitEventLoadingState) {
          showLoading();
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.extraFieldEvents.asMap().entries.map(
                        (extraFieldEvents) {
                          return Column(
                            children: [
                              BuildQuestionWidget(
                                isComeFromHome: widget.isComeFromHome,
                                extraFieldEvents: extraFieldEvents.value,
                                questionType: getQuestionType(
                                  extraFieldEvents.value.controlTypeCode,
                                ),
                                onChange: (ExtraFieldEvents extraField,
                                    String? image, File? file) {
                                  _bloc.add(
                                    SubmitEventValidate(
                                      extraFieldEvents: extraField,
                                      image: image,
                                      file: file,
                                    ),
                                  );
                                },
                              ),
                              if (extraFieldEvents.key !=
                                  widget.extraFieldEvents.length - 1)
                                const Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      thickness: 1.5,
                                      color: ColorSchemes.dividerColor,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                )
                            ],
                          );
                        },
                      ).toList(),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      child: CustomButtonWidget(
                        onTap: () async {
                          _bloc.add(SubmitEventRefresh());
                        },
                        text: S.of(context).ok,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void _showMessageDialog(String message, String path) {
    showMessageDialogWidget(
      context: context,
      text: message,
      icon: path,
      buttonText: S.of(context).ok,
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  bool _validate() {
    for (var element in widget.extraFieldEvents) {
      if (element.isRequired) {
        if (element.value.isEmpty) {
          return false;
        }
      }
    }
    return true;
  }
}
