import 'package:city_eye/src/domain/entities/home/city_eye/multimedia_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_multimedia_type.g.dart';

@JsonSerializable()
class RemoteMultiMediaTypes {
  final int? id;
  final bool? isVisible;
  final String? code;

  const RemoteMultiMediaTypes({
    this.id,
    this.isVisible,
    this.code,
  });

  factory RemoteMultiMediaTypes.fromJson(Map<String, dynamic> json) =>
      _$RemoteMultiMediaTypesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteMultiMediaTypesToJson(this);
}

extension RemoteMultiMediaTypesX on RemoteMultiMediaTypes? {
  MultiMediaTypes toDomain() {
    return MultiMediaTypes(
      id: this?.id ?? 0,
      isVisible: this?.isVisible ?? false,
      code: this?.code ?? '',
    );
  }
}

extension RemoteMultiMediaTypesListExtension on List<RemoteMultiMediaTypes>? {
  List<MultiMediaTypes> toDomain() {
    return this?.map((e) => e.toDomain()).toList() ?? [];
  }
}
