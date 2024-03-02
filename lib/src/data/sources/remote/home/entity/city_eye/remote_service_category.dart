import 'package:city_eye/src/domain/entities/home/city_eye/service_category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_service_category.g.dart';

@JsonSerializable()
class RemoteServicesCategorys {
  final int? id;
  final String? name;
  final String? code;
  final String? logo;
  final int? sortNo;

  const RemoteServicesCategorys({
    this.id = 0,
    this.name = "",
    this.code = "",
    this.logo = "",
    this.sortNo = 0,
  });

  factory RemoteServicesCategorys.fromJson(Map<String, dynamic> json) =>
      _$RemoteServicesCategorysFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteServicesCategorysToJson(this);
}

extension RemoteServicesCategorysExtension on RemoteServicesCategorys? {
  ServicesCategory mapToDomain() => ServicesCategory(
        id: this?.id ?? 0,
        name: this?.name ?? "",
        code: this?.code ?? "",
        logo: this?.logo ?? "",
        sortNo: this?.sortNo ?? 0,
      );
}
