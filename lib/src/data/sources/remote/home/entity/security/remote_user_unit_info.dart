import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_user.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_user_type.dart';
import 'package:city_eye/src/domain/entities/home/security/user.dart';
import 'package:city_eye/src/domain/entities/home/security/user_type.dart';
import 'package:city_eye/src/domain/entities/home/security/user_unit_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_user_unit_info.g.dart';

@JsonSerializable()
class RemoteUserUnitInfo {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'userType')
  final RemoteUserType? userType;
  @JsonKey(name: 'user')
  final RemoteUser? user;
  @JsonKey(name: 'compoundName')
  final String? compoundName;
  @JsonKey(name: 'unitNO')
  final String? unitNO;
  @JsonKey(name: 'unitName')
  final String? unitName;
  @JsonKey(name: 'gasNO')
  final String? gasNO;
  @JsonKey(name: 'telephone')
  final String? telephone;

  const RemoteUserUnitInfo({
    this.id,
    this.userType,
    this.user,
    this.compoundName,
    this.unitNO,
    this.unitName,
    this.gasNO,
    this.telephone,
  });

  factory RemoteUserUnitInfo.fromJson(Map<String, dynamic> json) =>
      _$RemoteUserUnitInfoFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteUserUnitInfoToJson(this);
}

extension RemoteUserUnitInfoExtention on RemoteUserUnitInfo? {
  UserUnitInfo mapToDomain() {
    return UserUnitInfo(
      id: this?.id ?? 0,
      userType: this?.userType?.mapToDomain() ?? const UserType(),
      user: this?.user?.mapToDomain() ?? const User(),
      compoundName: this?.compoundName ?? "",
      unitNO: this?.unitNO ?? "",
      unitName: this?.unitName ?? "",
      gasNO: this?.gasNO ?? "",
      telephone: this?.telephone ?? "",
    );
  }
}
