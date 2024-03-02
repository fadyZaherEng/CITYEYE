import 'package:city_eye/src/domain/entities/dashboard/get_service_number.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_get_service_number.g.dart';

@JsonSerializable()
class RemoteGetServiceNumber {
  @JsonKey(name: 'categoryId')
  final int? categoryId;
  @JsonKey(name: 'categoryName')
  final String? categoryName;
  @JsonKey(name: 'categorySubscripersCount')
  final int? categorySubscripersCount;

  const RemoteGetServiceNumber({
    this.categoryId,
    this.categoryName,
    this.categorySubscripersCount,
  });

  factory RemoteGetServiceNumber.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetServiceNumberFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetServiceNumberToJson(this);
}

extension RemoteGetServiceNumberExtension on RemoteGetServiceNumber? {
  GetServiceNumber mapToDomain() => GetServiceNumber(
        categoryId: this?.categoryId ?? 0,
        categoryName: this?.categoryName ?? "",
        categorySubscripersCount: this?.categorySubscripersCount ?? 0,
      );
}

extension RemoteListGetServiceNumberExtension on List<RemoteGetServiceNumber?> {
  List<GetServiceNumber> mapToDomain() {
    return map((e) => e.mapToDomain()).toList();
  }
}
