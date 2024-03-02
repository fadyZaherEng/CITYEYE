import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/domain/entities/notification/notification_item.dart';
import 'package:city_eye/src/domain/repositories/more_repository.dart';

class GetNotificationsUseCase {
  final MoreRepository _moreRepository;

  GetNotificationsUseCase(this._moreRepository);

  Future<DataState<List<NotificationItem>>> call() async =>
      await _moreRepository.getNotifications();
}
