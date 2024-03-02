import 'package:city_eye/src/domain/entities/support/support_compund_stuff.dart';
import 'package:json_annotation/json_annotation.dart';
part 'remote_support_compound_stuff.g.dart';

@JsonSerializable()
final class RemoteSupportCompoundStuff {
  final int? id;
  final String? name;

  const RemoteSupportCompoundStuff({
    this.id = 0,
    this.name = "",
  });

  factory RemoteSupportCompoundStuff.fromJson(Map<String, dynamic> json) =>
      _$RemoteSupportCompoundStuffFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteSupportCompoundStuffToJson(this);
}

extension RemoteSupportCompoundStuffExtension on RemoteSupportCompoundStuff? {
  SupportCompoundStuff mapToDomain() => SupportCompoundStuff(
        id: this?.id ?? 0,
        name: this?.name ?? "",
      );
}
