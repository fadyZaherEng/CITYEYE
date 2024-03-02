import 'package:city_eye/src/domain/entities/home/city_eye/home_section.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_home_section.g.dart';

@JsonSerializable()
class RemoteHomeSections {
  final int? id;
  final String? code;
  final bool? isvisible;

  const RemoteHomeSections({
    this.id = 0,
    this.code = "",
    this.isvisible = false,
  });

  factory RemoteHomeSections.fromJson(Map<String, dynamic> json) =>
      _$RemoteHomeSectionsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteHomeSectionsToJson(this);
}

extension RemoteHomeSectionsExtension on RemoteHomeSections? {
  HomeSection mapToDomain() => HomeSection(
        id: this?.id ?? 0,
        code: this?.code ?? "",
        isvisible: this?.isvisible ?? false,
      );
}
