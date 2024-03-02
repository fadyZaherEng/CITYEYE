import 'package:city_eye/src/domain/entities/support/support_category.dart';
import 'package:json_annotation/json_annotation.dart';
part 'remote_support_category.g.dart';

@JsonSerializable()
final class RemoteSupportCategory {
  final int? id;
  final String? code;
  final String? name;
  final String? logo;

  const RemoteSupportCategory({
    this.id = 0,
    this.code = "",
    this.name = "",
    this.logo = "",
  });

  factory RemoteSupportCategory.fromJson(Map<String, dynamic> json) =>
      _$RemoteSupportCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteSupportCategoryToJson(this);
}

extension RemoteSupportCategoryExtension on RemoteSupportCategory? {
  SupportCategory mapToDomain() => SupportCategory(
        id: this?.id ?? 0,
        code: this?.code ?? "",
        name: this?.name ?? "",
        logo: this?.logo ?? "",
      );
}
