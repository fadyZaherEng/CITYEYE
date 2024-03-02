import 'dart:io';

import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/events/request/submit_event_request.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/submit_event.dart';
import 'package:city_eye/src/domain/repositories/home_repository.dart';

final class SubmitEventUseCase {
  final HomeRepository _homeRepository;

  SubmitEventUseCase(this._homeRepository);

  @override
  Future<DataState<SubmitEvent>> call({
    required SubmitEventRequest submitEventRequest,
    required Map<String, File>? files,
  }) async {
    return _homeRepository.submitEvent(
      submitEventRequest: submitEventRequest,
      file: files,
    );
  }
}
