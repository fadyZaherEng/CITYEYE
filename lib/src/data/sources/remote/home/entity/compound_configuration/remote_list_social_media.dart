import 'package:city_eye/src/data/sources/remote/home/entity/compound_configuration/remote_social_media_type.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/list_social_media.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/social_media_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_list_social_media.g.dart';

@JsonSerializable()
class RemoteListSocialMedia {
  final int? id;
  final String? value;
  final RemoteSocialMediaType? socialMediaType;

  const RemoteListSocialMedia({
    this.id,
    this.value,
    this.socialMediaType,
  });

  factory RemoteListSocialMedia.fromJson(Map<String, dynamic> json) =>
      _$RemoteListSocialMediaFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteListSocialMediaToJson(this);
}

extension RemoteListSocialMediaX on RemoteListSocialMedia? {
  ListSocialMedia toDomain() {
    return ListSocialMedia(
      id: this?.id ?? 0,
      value: this?.value ?? '',
      socialMediaType:
          this?.socialMediaType?.toDomain() ?? const SocialMediaType(),
    );
  }
}
