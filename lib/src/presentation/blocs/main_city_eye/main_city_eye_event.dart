part of 'main_city_eye_bloc.dart';

@immutable
abstract class MainCityEyeEvent {}

class MainCityEyeChangeNavigationEvent extends MainCityEyeEvent {
  final int index;
  MainCityEyeChangeNavigationEvent(this.index);
}
