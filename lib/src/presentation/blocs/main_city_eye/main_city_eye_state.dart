part of 'main_city_eye_bloc.dart';

@immutable
abstract class MainCityEyeState {}

class MainCityEyeInitial extends MainCityEyeState {}

class MainCityEyeChangeNavigationState extends MainCityEyeState {
  final int index;
  MainCityEyeChangeNavigationState(this.index);
}
