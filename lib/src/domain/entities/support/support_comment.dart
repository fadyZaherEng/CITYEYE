import 'package:city_eye/src/domain/entities/sign_in/user.dart';
import 'package:equatable/equatable.dart';

final class SupportComment extends Equatable {
  final int id;
  final String message;
  final String date;
  final bool isImage;
  final User user;

  const SupportComment({
    this.id = 0,
    this.message = "",
    this.date = "",
    this.isImage = false,
    this.user = const User(),
  });

  @override
  List<Object> get props => [id, message, date, isImage, user];

  SupportComment copyWith({
    int? id,
    String? message,
    String? date,
    bool? isImage,
    User? user,
  }) {
    return SupportComment(
      id: id ?? this.id,
      message: message ?? this.message,
      date: date ?? this.date,
      isImage: isImage ?? this.isImage,
      user: user ?? this.user,
    );
  }
}
