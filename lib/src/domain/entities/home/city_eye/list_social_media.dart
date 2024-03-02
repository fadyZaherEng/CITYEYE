import 'package:city_eye/src/domain/entities/home/city_eye/social_media_type.dart';
import 'package:equatable/equatable.dart';

class ListSocialMedia extends Equatable {
  final int id;
  final String value;
  final SocialMediaType socialMediaType;

  const ListSocialMedia({
    this.id = 0,
    this.value = '',
    this.socialMediaType = const SocialMediaType(),
  });

  @override
  List<Object?> get props => [id, value, socialMediaType];
}
