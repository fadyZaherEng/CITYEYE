// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:city_eye/src/domain/usecase/get_language_use_case.dart';
import 'package:city_eye/src/domain/usecase/set_language_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<Locale> {
  final GetLanguageUseCase _getLanguageUseCase;
  final SetLanguageUseCase _setLanguageUseCase;

  AppCubit(
    this._getLanguageUseCase,
    this._setLanguageUseCase,
  ) : super(Locale(window.locale.languageCode)) {
    getLanguage();
  }

  void getLanguage() async {
    final language = _getLanguageUseCase();
    await _setLanguageUseCase(language);
    emit(Locale(language));
  }
}
