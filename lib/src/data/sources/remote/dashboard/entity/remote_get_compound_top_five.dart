import 'package:city_eye/src/domain/entities/dashboard/service_category.dart';
import 'package:city_eye/src/domain/entities/dashboard/service_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_get_compound_top_five.g.dart';

@JsonSerializable()
class RemoteServiceData {
  RemoteServiceCategory? serviceCategory;
  int? countOfUsers;

  RemoteServiceData({this.serviceCategory, this.countOfUsers});

  factory RemoteServiceData.fromJson(Map<String, dynamic> json) =>
      _$RemoteServiceDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteServiceDataToJson(this);
}

@JsonSerializable()
class RemoteServiceCategory {
  int? id;
  String? name;
  String? code;
  String? logo;

  RemoteServiceCategory({this.id, this.name, this.code, this.logo});

  factory RemoteServiceCategory.fromJson(Map<String, dynamic> json) =>
      _$RemoteServiceCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteServiceCategoryToJson(this);
}

extension serviceDataExtension on RemoteServiceData? {
  ServiceData toDomain() {
    return ServiceData(
        countOfUsers: this?.countOfUsers ?? 0,
        serviceCategory:
            this?.serviceCategory.mapToDomain() ?? const ServiceCategory());
  }
}

extension CategoryDataExtension on RemoteServiceCategory? {
  ServiceCategory mapToDomain() {
    return ServiceCategory(
      code: this?.code ?? "",
      id: this?.id ?? 0,
      logo: this?.logo ?? "",
      name: this?.name ?? "",
    );
  }
}

extension CategoryDataListExtension on List<RemoteServiceData>? {
  List<ServiceData> mapToDomain() {
    return (this?.map((e) => e.toDomain()) ?? []).toList();
  }
}
