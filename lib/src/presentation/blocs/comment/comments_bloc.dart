import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/support/request/add_support_comment_request.dart';
import 'package:city_eye/src/data/sources/remote/support/request/get_support_comments_request.dart';
import 'package:city_eye/src/domain/entities/support/support_comment.dart';
import 'package:city_eye/src/domain/usecase/support/add_support_comment_use_case.dart';
import 'package:city_eye/src/domain/usecase/support/get_support_comment_use_case.dart';
import 'package:equatable/equatable.dart';

part 'comments_event.dart';

part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final GetSupportCommentsUseCase _getSupportCommentsUseCase;
  final AddSupportCommentUseCase _addSupportCommentUseCase;

  CommentsBloc(
    this._getSupportCommentsUseCase,
    this._addSupportCommentUseCase,
  ) : super(CommentsInitial()) {
    on<GetCommentsEvent>(_onGetCommentsEvent);
    on<AskForCameraPermissionEvent>(_onAskForCameraPermissionEvent);
    on<CameraPressedEvent>(_onCameraPressedEvent);
    on<GalleryPressedEvent>(_onGalleryPressedEvent);
    on<MediaIconPressedEvent>(_onMediaIconPressedEvent);
    on<SendCommentEvent>(_onSendCommentEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
    on<ScrollToLastIndexEvent>(_onScrollToLastIndexEvent);
  }

  FutureOr<void> _onGetCommentsEvent(
      GetCommentsEvent event, Emitter<CommentsState> emit) async {
    if(event.showLoading) {
      emit(ShowSkeletonState());
    }
    final DataState<List<SupportComment>> commentsState =
        await _getSupportCommentsUseCase(
            GetSupportCommentsRequest(requestId: event.id));
    if (commentsState is DataSuccess) {
      emit(GetCommentsSuccessState(comments: commentsState.data ?? []));
    } else if (commentsState is DataFailed) {
      emit(GetCommentsErrorState(errorMessage: commentsState.message ?? ""));
    }
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<CommentsState> emit) {
    emit(NavigateBackState());
  }

  FutureOr<void> _onAskForCameraPermissionEvent(
      AskForCameraPermissionEvent event, Emitter<CommentsState> emit) {
    emit(AskForCameraPermissionState(onTab: event.onTab));
  }

  FutureOr<void> _onCameraPressedEvent(
      CameraPressedEvent event, Emitter<CommentsState> emit) {
    emit(OpenCameraState());
  }

  FutureOr<void> _onGalleryPressedEvent(
      GalleryPressedEvent event, Emitter<CommentsState> emit) {
    emit(OpenGalleryState());
  }

  FutureOr<void> _onMediaIconPressedEvent(
      MediaIconPressedEvent event, Emitter<CommentsState> emit) {
    emit(OpenMediaBottomSheetState());
  }

  FutureOr<void> _onSendCommentEvent(
      SendCommentEvent event, Emitter<CommentsState> emit) async {
    emit(ShowLoadingState());
    final DataState<List<SupportComment>> addCommentState = await _addSupportCommentUseCase(
        event.addSupportCommentRequest,
        event.image);
    if (addCommentState is DataSuccess) {
      emit(GetCommentsSuccessState(comments: addCommentState.data ?? []));
    } else if (addCommentState is DataFailed) {
      emit(GetCommentsErrorState(errorMessage: addCommentState.message ?? ""));
    }

    emit(HideLoadingState());
  }

  FutureOr<void> _onScrollToLastIndexEvent(
      ScrollToLastIndexEvent event, Emitter<CommentsState> emit) async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(ScrollToLastIndexState());
  }
}
