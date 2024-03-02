import 'package:city_eye/src/domain/entities/home/city_eye/curancy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_curancy.g.dart';

@JsonSerializable()
class RemoteCurrency {
  final int? id;
  final String? name;

  const RemoteCurrency({
    this.id,
    this.name,
  });

  factory RemoteCurrency.fromJson(Map<String, dynamic> json) =>
      _$RemoteCurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteCurrencyToJson(this);
}

extension RemoteCurrencyX on RemoteCurrency? {
  Currency toDomain() {
    return Currency(
      id: this?.id ?? 0,
      name: this?.name ?? '',
    );
  }
}
