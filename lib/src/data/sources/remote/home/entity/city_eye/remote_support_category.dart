import 'package:city_eye/src/domain/entities/home/city_eye/support_category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_support_category.g.dart';

@JsonSerializable()
class RemoteSupportCategorys {
  final int? id;
  final String? name;
  final String? code;
  final String? logo;
  final int? sortNo;

  const RemoteSupportCategorys({
    this.id = 0,
    this.name = "",
    this.code = "",
    this.logo = "",
    this.sortNo = 0,
  });

  factory RemoteSupportCategorys.fromJson(Map<String, dynamic> json) =>
      _$RemoteSupportCategorysFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteSupportCategorysToJson(this);
}

extension RemoteSupportCategorysExtension on RemoteSupportCategorys? {
  SupportCategory mapToDomain() => SupportCategory(
        id: this?.id ?? 0,
        name: this?.name ?? "",
        code: this?.code ?? "",
        logo: this?.logo ?? "",
        sortNo: this?.sortNo ?? 0,
      );
}
