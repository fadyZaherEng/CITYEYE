import 'package:city_eye/src/data/sources/remote/support/entity/remote_support_attachment.dart';
import 'package:city_eye/src/data/sources/remote/support/entity/remote_support_category.dart';
import 'package:city_eye/src/data/sources/remote/support/entity/remote_support_compound_stuff.dart';
import 'package:city_eye/src/data/sources/remote/support/entity/remote_support_tech_status.dart';
import 'package:city_eye/src/data/sources/remote/support/entity/remote_support_user_units.dart';
import 'package:city_eye/src/domain/entities/support/support.dart';
import 'package:json_annotation/json_annotation.dart';
part 'remote_support.g.dart';

@JsonSerializable(explicitToJson: true)
final class RemoteSupport {
  final int? requestId;
  final String? requestDate;
  final String? requestDescription;
  @JsonKey(name: 'compoundStuff')
  final RemoteSupportCompoundStuff? supportCompoundStuff;
  @JsonKey(name: 'userUnits')
  final RemoteSupportUserUnits? supportUserUnits;
  @JsonKey(name: 'supportCatgeory')
  final RemoteSupportCategory? supportCategory;
  @JsonKey(name: 'supportTechStatus')
  final RemoteSupportTechStatus? supportTechStatus;
  @JsonKey(name: 'supportRequestAttachments')
  final List<RemoteSupportAttachment>? supportAttachments;

  const RemoteSupport({
    this.requestId = 0,
    this.requestDate = "",
    this.requestDescription = "",
    this.supportCompoundStuff = const RemoteSupportCompoundStuff(),
    this.supportUserUnits = const RemoteSupportUserUnits(),
    this.supportCategory = const RemoteSupportCategory(),
    this.supportTechStatus = const RemoteSupportTechStatus(),
    this.supportAttachments = const [],
  });

  factory RemoteSupport.fromJson(Map<String, dynamic> json) =>
      _$RemoteSupportFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteSupportToJson(this);
}

extension RemoteSupportExtension on RemoteSupport? {
  Support mapToDomain() => Support(
        requestId: this?.requestId ?? 0,
        requestDate: this?.requestDate ?? "",
        requestDescription: this?.requestDescription ?? "",
        supportCompoundStuff:
            (this?.supportCompoundStuff ?? const RemoteSupportCompoundStuff())
                .mapToDomain(),
        supportUserUnits:
            (this?.supportUserUnits ?? const RemoteSupportUserUnits())
                .mapToDomain(),
        supportCategory:
            (this?.supportCategory ?? const RemoteSupportCategory())
                .mapToDomain(),
        supportTechStatus:
            (this?.supportTechStatus ?? const RemoteSupportTechStatus())
                .mapToDomain(),
        supportAttachments: this?.supportAttachments.mapToDomain() ?? [],
      );
}

extension RemoteSupportListExtension on List<RemoteSupport>? {
  List<Support> mapToDomain() => this!.map((e) => e.mapToDomain()).toList();
}
