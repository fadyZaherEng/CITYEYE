class FirebaseNotificationData {
  final String message;
  final String code;
  final int id;

  FirebaseNotificationData({
    required this.message,
    required this.code,
    required this.id,
  });

  factory FirebaseNotificationData.fromJson(Map<String, dynamic> json) {
    return FirebaseNotificationData(
      id: int.parse(json['id']),
      message: json['title'] ?? "",
      code: json['view'] ?? "",
    );
  }

  @override
  String toString() {
    return 'FirebaseNotificationData{message: $message, code: $code, id: $id}';
  }
}