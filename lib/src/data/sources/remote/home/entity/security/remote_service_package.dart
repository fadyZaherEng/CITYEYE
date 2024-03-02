import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_service_category.dart';
import 'package:city_eye/src/domain/entities/home/security/service_category.dart';
import 'package:city_eye/src/domain/entities/home/security/service_package.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_service_package.g.dart';

@JsonSerializable()
class RemoteServicePackages {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'isCountType')
  final bool? isCountType;
  @JsonKey(name: 'serviceCategory')
  final RemoteServiceCategory? serviceCategory;

  const RemoteServicePackages({
    this.id,
    this.name,
    this.isCountType,
    this.serviceCategory,
  });

  factory RemoteServicePackages.fromJson(Map<String, dynamic> json) =>
      _$RemoteServicePackagesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteServicePackagesToJson(this);
}

extension RemoteServicePackagesExtention on RemoteServicePackages? {
  ServicePackages mapToDomain() {
    return ServicePackages(
      id: this?.id ?? 0,
      name: this?.name ?? "",
      isCountType: this?.isCountType ?? false,
      serviceCategory:
          this?.serviceCategory?.mapToDomain() ?? const ServiceCategory(),
    );
  }
}
