part of 'comments_bloc.dart';

abstract class CommentsEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetCommentsEvent extends CommentsEvent {
  final int id;
  final bool showLoading;

  GetCommentsEvent({
    required this.id,
    required this.showLoading,
  });
}

class MediaIconPressedEvent extends CommentsEvent {}

class AskForCameraPermissionEvent extends CommentsEvent {
  final Function() onTab;

  AskForCameraPermissionEvent({
    required this.onTab,
  });
}

class CameraPressedEvent extends CommentsEvent {}

class GalleryPressedEvent extends CommentsEvent {}

class SendCommentEvent extends CommentsEvent {
  final String image;
  final AddSupportCommentRequest addSupportCommentRequest;

  SendCommentEvent({
    this.image = "",
    required this.addSupportCommentRequest,
  });
}

class NavigateBackEvent extends CommentsEvent {}

class ScrollToLastIndexEvent extends CommentsEvent {}
