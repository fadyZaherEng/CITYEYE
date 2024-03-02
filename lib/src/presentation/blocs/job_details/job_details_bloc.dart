import 'dart:async';

import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/support/request/change_support_request.dart';
import 'package:city_eye/src/data/sources/remote/support/request/support_details_request.dart';
import 'package:city_eye/src/domain/entities/support/support.dart';
import 'package:city_eye/src/domain/entities/support/support_attachment.dart';
import 'package:city_eye/src/domain/usecase/job_details_description_use_case.dart';
import 'package:city_eye/src/domain/usecase/support/change_support_status_use_case.dart';
import 'package:city_eye/src/domain/usecase/support/get_available_support_status.dart';
import 'package:city_eye/src/domain/usecase/support/get_support_details_use_case.dart';
import 'package:city_eye/src/presentation/screens/job_details/utils/support_attachment_enum.dart';
import 'package:city_eye/src/presentation/screens/job_details/utils/support_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'job_details_event.dart';
part 'job_details_state.dart';

class JobDetailsBloc extends Bloc<JobDetailsEvent, JobDetailsState> {
  final GetSupportDetailsUseCase _getSupportDetailsUseCase;
  final ChangeSupportStatusUseCase _changeSupportUseCase;
  final GetAvailableSupportStatusUseCase _getAvailableSupportStatusUseCase;
  final JopDescriptionValidationUseCase _jopDescriptionValidationUseCase;

  JobDetailsBloc(
    this._getSupportDetailsUseCase,
    this._getAvailableSupportStatusUseCase,
    this._changeSupportUseCase,
    this._jopDescriptionValidationUseCase,
  ) : super(JobDetailsInitial()) {
    on<BackEvent>(_onBackEvent);
    on<GetJobsDetailsEvent>(_onGetDataFromRemoteEvent);
    on<OnBottomReceiveClickEvent>(_onOnBottomReceiveClickEvent);
    on<OnBottomStartJobClickEvent>(_onOnBottomStartJobClickEvent);
    on<OnBottomCompleteClickEvent>(_onOnBottomCompleteClickEvent);
    on<OnBottomMoreClickEvent>(_onOnBottomMoreClickEvent);
    on<OnBottomHoldClickEvent>(_onBottomHoldClickEvent);
    on<OnBottomNeedPaymentClickEvent>(_onBottomNeedPaymentClickEvent);
    on<OnBottomCancelClickEvent>(_onBottomCancelClickEvent);
    on<ActionWidgetClickedEvent>(_onActionWidgetClickedEvent);
    on<ExtractSupportAttachmentEvent>(_onExtractSupportAttachmentEvent);
    on<GetAvailableSupportStatusEvent>(_onGetAvailableSupportStatusEvent);
    on<OnNeedPaymentClickEvent>(_onOnNeedPaymentClickEvent);
    on<OnNeedPaymentClearDataEvent>(_onNeedPaymentClearDataEvent);
  }

  FutureOr<void> _onBackEvent(BackEvent event, Emitter<JobDetailsState> emit) {
    emit(BackState());
  }

  FutureOr<void> _onGetDataFromRemoteEvent(
      GetJobsDetailsEvent event, Emitter<JobDetailsState> emit) async {
    emit(ShowSkeletonState());
    final DataState<Support> jobState = await _getSupportDetailsUseCase(
        SupportDetailsRequest(requestId: event.requestId));
    if (jobState is DataSuccess) {
      emit(GetJobDetailsSuccessState(
        job: jobState.data ?? const Support(),
        massage: jobState.message ?? "",
      ));
    } else if (jobState is DataFailed) {
      emit(GetJobDetailsFailedState(message: jobState.message ?? ""));
    }
  }

  FutureOr<void> _onOnBottomReceiveClickEvent(
      OnBottomReceiveClickEvent event, Emitter<JobDetailsState> emit) async {
    emit(ShowLoadingState());
    final DataState<Support> jobState =
        await _changeSupportUseCase(event.changeSupportRequest, []);
    if (jobState is DataSuccess) {
      emit(GetJobDetailsSuccessState(
        job: jobState.data ?? const Support(),
        isStatusChange: true,
        massage: jobState.message ?? "",
      ));
    } else if (jobState is DataFailed) {
      emit(GetJobDetailsFailedState(message: jobState.message ?? ""));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onOnBottomStartJobClickEvent(
      OnBottomStartJobClickEvent event, Emitter<JobDetailsState> emit) async {
    emit(ShowLoadingState());
    final DataState<Support> jobState =
        await _changeSupportUseCase(event.changeSupportRequest, []);
    if (jobState is DataSuccess) {
      emit(GetJobDetailsSuccessState(
        job: jobState.data ?? const Support(),
        isStatusChange: true,
        massage: jobState.message ?? "",
      ));
    } else if (jobState is DataFailed) {
      emit(GetJobDetailsFailedState(message: jobState.message ?? ""));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onOnBottomCompleteClickEvent(
      OnBottomCompleteClickEvent event, Emitter<JobDetailsState> emit) async {
    emit(ShowLoadingState());
    final DataState<Support> jobState =
        await _changeSupportUseCase(event.changeSupportRequest, []);
    if (jobState is DataSuccess) {
      emit(GetJobDetailsSuccessState(
        job: jobState.data ?? const Support(),
        isStatusChange: true,
        massage: jobState.message ?? "",
      ));
    } else if (jobState is DataFailed) {
      emit(GetJobDetailsFailedState(message: jobState.message ?? ""));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onBottomHoldClickEvent(
      OnBottomHoldClickEvent event, Emitter<JobDetailsState> emit) async {
    emit(ShowLoadingState());
    final DataState<Support> jobState =
        await _changeSupportUseCase(event.changeSupportRequest, []);
    if (jobState is DataSuccess) {
      emit(GetJobDetailsSuccessState(
        job: jobState.data ?? const Support(),
        isStatusChange: true,
        massage: jobState.message ?? "",
      ));
    } else if (jobState is DataFailed) {
      emit(GetJobDetailsFailedState(message: jobState.message ?? ""));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onBottomNeedPaymentClickEvent(
      OnBottomNeedPaymentClickEvent event,
      Emitter<JobDetailsState> emit) async {
    emit(ShowLoadingState());
    final DataState<Support> jobState =
        await _changeSupportUseCase(event.changeSupportRequest, []);
    if (jobState is DataSuccess) {
      emit(GetJobDetailsSuccessState(
        job: jobState.data ?? const Support(),
        isStatusChange: true,
        massage: jobState.message ?? "",
      ));
    } else if (jobState is DataFailed) {
      emit(GetJobDetailsFailedState(message: jobState.message ?? ""));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onBottomCancelClickEvent(
      OnBottomCancelClickEvent event, Emitter<JobDetailsState> emit) async {
    emit(ShowLoadingState());
    final DataState<Support> jobState =
        await _changeSupportUseCase(event.changeSupportRequest, []);
    if (jobState is DataSuccess) {
      emit(GetJobDetailsSuccessState(
        job: jobState.data ?? const Support(),
        isStatusChange: true,
        massage: jobState.message ?? "",
      ));
    } else if (jobState is DataFailed) {
      emit(GetJobDetailsFailedState(message: jobState.message ?? ""));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onOnBottomMoreClickEvent(
      OnBottomMoreClickEvent event, Emitter<JobDetailsState> emit) async {
    // await Future.delayed(const Duration(seconds: 2));
    emit(OnBottomMoreSuccessState(message: "More Success"));
  }

  FutureOr<void> _onActionWidgetClickedEvent(
      ActionWidgetClickedEvent event, Emitter<JobDetailsState> emit) {
    emit(ActionWidgetClickedState());
  }

  FutureOr<void> _onExtractSupportAttachmentEvent(
      ExtractSupportAttachmentEvent event, Emitter<JobDetailsState> emit) {
    final List<SupportAttachment> supportAttachment =
        event.support.supportAttachments;
    SupportAttachment audioAttachment = const SupportAttachment();
    SupportAttachment videoAttachment = const SupportAttachment();
    List<SupportAttachment> imageAttachments = List.empty();
    if (supportAttachment.isNotEmpty) {
      if (supportAttachment
          .any((element) => element.name == SupportAttachmentName.audio.name)) {
        audioAttachment = supportAttachment.singleWhere((attachment) =>
            attachment.name == SupportAttachmentName.audio.name);
      }
      if (supportAttachment
          .any((element) => element.name == SupportAttachmentName.video.name)) {
        videoAttachment = supportAttachment.singleWhere((attachment) =>
            attachment.name == SupportAttachmentName.video.name);
      }
      if (supportAttachment
          .any((element) => element.name == SupportAttachmentName.image.name)) {
        imageAttachments = supportAttachment
            .where((attachment) =>
                attachment.name == SupportAttachmentName.image.name)
            .toList();
      }

      emit(ExtractSupportAttachmentState(
        images: imageAttachments,
        video: videoAttachment,
        audio: audioAttachment,
      ));
    }
  }

  FutureOr<void> _onGetAvailableSupportStatusEvent(
      GetAvailableSupportStatusEvent event, Emitter<JobDetailsState> emit) {
    final List<SupportStatusEnum> availableStatus =
        _getAvailableSupportStatusUseCase(
      statusId: event.statusId,
    );
    emit(GetAvailableSupportStatusState(availableStatus: availableStatus));
  }

  FutureOr<void> _onOnNeedPaymentClickEvent(
      OnNeedPaymentClickEvent event, Emitter<JobDetailsState> emit) {
    emit(OnNeedPaymentClickState());
  }

  FutureOr<void> _onNeedPaymentClearDataEvent(
      OnNeedPaymentClearDataEvent event, Emitter<JobDetailsState> emit) {
    emit(OnNeedPaymentBackDataState());
  }
}
