import 'package:city_eye/src/data/sources/remote/sign-in/entity/remote_user.dart';
import 'package:city_eye/src/domain/entities/support/support_comment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_support_comment.g.dart';

@JsonSerializable(explicitToJson: true)
final class RemoteSupportComment {
  final int id;
  final String message;
  final String date;
  final bool isImage;
  final RemoteUser user;

  const RemoteSupportComment({
    this.id = 0,
    this.message = "",
    this.date = "",
    this.isImage = false,
    this.user = const RemoteUser(),
  });

  factory RemoteSupportComment.fromJson(Map<String, dynamic> json) =>
      _$RemoteSupportCommentFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteSupportCommentToJson(this);
}

extension RemoteSupportCommentExtension on RemoteSupportComment {
  SupportComment mapToDomain() => SupportComment(
        id: id,
        message: message,
        date: date,
        isImage: isImage,
        user: user.mapToDomain(),
      );
}

extension RemoteSupportCommentListExtension on List<RemoteSupportComment>? {
  List<SupportComment> mapToDomain() =>
      this!.map((supportComment) => supportComment.mapToDomain()).toList();
}
