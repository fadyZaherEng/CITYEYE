import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/notifications/request/notifications_disable_request.dart';
import 'package:city_eye/src/domain/repositories/more_repository.dart';

class NotificationsDisableUseCase {
  final MoreRepository _moreRepository;

  NotificationsDisableUseCase(this._moreRepository);

  Future<DataState<String>> call(NotificationsDisableRequest request) async =>
      await _moreRepository.disableNotifications(request);
}