part of 'add_payment_bloc.dart';

abstract class AddPaymentState extends Equatable {
  const AddPaymentState();

  @override
  List<Object?> get props => [
    identityHashCode(this),
  ];

}

class AddPaymentInitial extends AddPaymentState {}

class ShowLoadingState extends AddPaymentState {}

class HideLoadingState extends AddPaymentState {}

class DescribeProblemValidState extends AddPaymentState {}

class DescribeProblemInvalidState extends AddPaymentState {}

class NavigateBackState extends AddPaymentState {}

class ShowVideoSkeletonState extends AddPaymentState {}

class OpenMediaBottomSheetState extends AddPaymentState {
  final MediaType mediaType;

  OpenMediaBottomSheetState({
    required this.mediaType,
  });
}

class AddImageState extends AddPaymentState {
  final File image;

  AddImageState({
    required this.image,
  });
}

class AddMultipleImageState extends AddPaymentState {
  final List<File> images;

  AddMultipleImageState({
    required this.images,
  });
}

class NoImageSelectedState extends AddPaymentState {
  final String message;

  NoImageSelectedState({
    required this.message,
  });
}

class AddVideoState extends AddPaymentState {
  final File video;
  final ImageSource imageSource;

  AddVideoState({
    required this.video,
    required this.imageSource,
  });
}

class NoVideoSelectedState extends AddPaymentState {
  final String message;

  NoVideoSelectedState({
    required this.message,
  });
}

class NavigateToVideoTrimmerScreenState extends AddPaymentState {
  final File video;
  final int maxDuration;

  NavigateToVideoTrimmerScreenState({
    required this.video,
    required this.maxDuration,
  });
}

class RemoveVideoState extends AddPaymentState {}

class RemoveImageState extends AddPaymentState {
  final List<File> images;
  final int index;

  RemoveImageState({
    required this.images,
    required this.index,
  });
}

class InitializeRecorderState extends AddPaymentState {}

class StartRecordingState extends AddPaymentState {}

class StopRecordingState extends AddPaymentState {}

class SaveAudioPathState extends AddPaymentState {
  final String audioPath;

  SaveAudioPathState({
    required this.audioPath,
  });
}

class RemoveAudioFileState extends AddPaymentState {
  final String audioPath;
  final bool isReplace;

  RemoveAudioFileState({
    required this.audioPath,
    required this.isReplace,
  });
}

class AudioStatusChangeState extends AddPaymentState {
  final bool isRecording;
  final int duration;

  AudioStatusChangeState({
    required this.isRecording,
    required this.duration,
  });
}

class ServiceAmountValidState extends AddPaymentState {}

class ServiceAmountInvalidState extends AddPaymentState {}

class SubmitPaymentSuccessState extends AddPaymentState {
  final String message;

  SubmitPaymentSuccessState({
    required this.message,
  });
}

class SubmitPaymentErrorState extends AddPaymentState {
  final String message;

  SubmitPaymentErrorState({
    required this.message,
  });
}


class OneAttachmentRequiredState extends AddPaymentState {
}