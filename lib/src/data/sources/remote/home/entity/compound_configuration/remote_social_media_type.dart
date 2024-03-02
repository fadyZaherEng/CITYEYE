import 'package:city_eye/src/domain/entities/home/city_eye/social_media_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_social_media_type.g.dart';

@JsonSerializable()
class RemoteSocialMediaType {
  final int? id;
  final String? name;
  final String? code;
  final String? logo;

  const RemoteSocialMediaType({
    this.id,
    this.name,
    this.code,
    this.logo,
  });

  factory RemoteSocialMediaType.fromJson(Map<String, dynamic> json) =>
      _$RemoteSocialMediaTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteSocialMediaTypeToJson(this);
}

extension RemoteSocialMediaTypeX on RemoteSocialMediaType? {
  SocialMediaType toDomain() {
    return SocialMediaType(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      code: this?.code ?? '',
      logo: this?.logo ?? '',
    );
  }
}
