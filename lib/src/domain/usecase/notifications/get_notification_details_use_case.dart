import 'package:city_eye/src/core/resources/data_state.dart';
import 'package:city_eye/src/data/sources/remote/city_eye/more/notifications/request/notification_details_request.dart';
import 'package:city_eye/src/domain/entities/notification/notification_item.dart';
import 'package:city_eye/src/domain/repositories/more_repository.dart';

class GetNotificationDetailsUseCase {
  final MoreRepository _moreRepository;

  GetNotificationDetailsUseCase(this._moreRepository);

  Future<DataState<NotificationItem>> call(
          NotificationDetailsRequest request) async =>
      await _moreRepository.getNotificationDetails(request);
}
