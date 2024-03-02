import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/notifications/request/notification_seen_request.dart';
import 'package:city_eye/src/domain/repositories/more_repository.dart';

class UpdateNotificationSeenUseCase {
  final MoreRepository _moreRepository;

  UpdateNotificationSeenUseCase(this._moreRepository);

  Future<DataState> call(
          NotificationSeenRequest notificationSeenRequest) async =>
      await _moreRepository.updateNotificationAsSeen(notificationSeenRequest);
}
