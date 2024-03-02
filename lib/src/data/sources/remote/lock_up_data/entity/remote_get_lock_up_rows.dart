import 'package:city_eye/src/domain/entities/lock_up_data/get_lock_up_data_rows.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_get_lock_up_rows.g.dart';

@JsonSerializable()
class RemoteGetLockUpRows {
  @JsonKey(name: "lookupCode")
  final String? lookupCode;
  @JsonKey(name: "lookupFiles")
  final List<RemoteLookupFiles>? lookupFiles;

  const RemoteGetLockUpRows({
    this.lookupCode,
    this.lookupFiles,
  });

  factory RemoteGetLockUpRows.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetLockUpRowsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetLockUpRowsToJson(this);
}

@JsonSerializable()
class RemoteLookupFiles {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "code")
  final String? code;
  @JsonKey(name: "sortNo")
  final int? sortNo;

  const RemoteLookupFiles({
    this.id,
    this.name,
    this.code,
    this.sortNo,
  });

  factory RemoteLookupFiles.fromJson(Map<String, dynamic> json) =>
      _$RemoteLookupFilesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteLookupFilesToJson(this);
}

extension RemoteLookupFilesMapper on RemoteLookupFiles? {
  LookupFiles mapToDomain() {
    return LookupFiles(
      id: this?.id ?? 0,
      name: this?.name ?? "",
      code: this?.code ?? "",
      sortNo: this?.sortNo ?? 0,
    );
  }
}

extension RemoteListLookupFilesMapper on List<RemoteLookupFiles?>? {
  List<LookupFiles> mapToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}

extension RemoteGetLockUpDataRowsMapper on RemoteGetLockUpRows? {
  GetLockUpRows mapToDomain() {
    return GetLockUpRows(
      lookupCode: this?.lookupCode ?? "",
      lookupFiles: this?.lookupFiles?.mapToDomain().toList() ?? [],
    );
  }
}

extension RemoteListGetLockUpDataRowsMapper on List<RemoteGetLockUpRows?>? {
  List<GetLockUpRows> mapToDomain() {
    return this?.map((e) => e.mapToDomain()).toList() ?? [];
  }
}
