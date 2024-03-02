import 'package:city_eye/src/domain/entities/home/city_eye/media_types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_media_types.g.dart';

@JsonSerializable()
class RemoteMultiMediaType {
  final int? id;
  final String? code;

  const RemoteMultiMediaType({
    this.id,
    this.code,
  });

  factory RemoteMultiMediaType.fromJson(Map<String, dynamic> json) =>
      _$RemoteMultiMediaTypeFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteMultiMediaTypeToJson(this);
}

extension RemoteMultiMediaTypeX on RemoteMultiMediaType? {
  MultiMediaType toDomain() {
    return MultiMediaType(
      id: this?.id ?? 0,
      code: this?.code ?? '',
    );
  }
}
