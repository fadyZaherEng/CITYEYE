import 'package:city_eye/src/domain/entities/support/support_attachment.dart';
import 'package:json_annotation/json_annotation.dart';
part 'remote_support_attachment.g.dart';

@JsonSerializable()
final class RemoteSupportAttachment {
  final String? name;
  final String? pathUrl;

  const RemoteSupportAttachment({
    this.name = "",
    this.pathUrl = "",
  });

  factory RemoteSupportAttachment.fromJson(Map<String, dynamic> json) =>
      _$RemoteSupportAttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteSupportAttachmentToJson(this);
}

extension RemoteSupportAttachmentExtension on RemoteSupportAttachment {
  SupportAttachment mapToDomain() => SupportAttachment(
        name: name ?? "",
        pathUrl: pathUrl ?? "",
      );
}

extension RemoteSupportAttachmentListExtension
    on List<RemoteSupportAttachment>? {
  List<SupportAttachment> mapToDomain() =>
      this!.map((e) => e.mapToDomain()).toList();
}
