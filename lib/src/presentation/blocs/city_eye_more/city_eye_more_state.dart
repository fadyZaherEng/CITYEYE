part of 'city_eye_more_bloc.dart';

@immutable
abstract class CityEyeMoreState {}

class CityEyeMoreInitial extends CityEyeMoreState {}

class CityEyeMoreLoading extends CityEyeMoreState {}

class CityEyeMoreGetCompoundConfigurationSuccess extends CityEyeMoreState {
  final GetCompoundConfiguration getCompoundConfiguration;
  CityEyeMoreGetCompoundConfigurationSuccess(
      {required this.getCompoundConfiguration});
}

class CityEyeMoreGetCompoundConfigurationFailed extends CityEyeMoreState {
  final String message;
  CityEyeMoreGetCompoundConfigurationFailed({required this.message});
}
