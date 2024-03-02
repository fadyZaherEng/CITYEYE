part of 'full_video_bloc.dart';

sealed class FullVideoState {}

class FullVideoInitial extends FullVideoState {}

class SuccessInitializeVideoState extends FullVideoState {
  final String videoUrl;

  SuccessInitializeVideoState({
    required this.videoUrl,
  });
}

class SuccessInitializeVideoPlayerState extends FullVideoState {}
