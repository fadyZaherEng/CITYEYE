
import 'package:json_annotation/json_annotation.dart';

part 'notifications_disable_request.g.dart';

@JsonSerializable()
class NotificationsDisableRequest {
  final bool status;

  NotificationsDisableRequest({
    required this.status
  });

  factory NotificationsDisableRequest.fromJson(Map<String, dynamic> json) =>
      _$NotificationsDisableRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsDisableRequestToJson(this);

  @override
  String toString() {
    return 'NotificationsDisableRequest{status: $status}';
  }
}