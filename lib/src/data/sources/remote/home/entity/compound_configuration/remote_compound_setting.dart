import 'package:city_eye/src/data/sources/remote/home/entity/compound_configuration/remote_compound_type.dart';
import 'package:city_eye/src/data/sources/remote/home/entity/compound_configuration/remote_curancy.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/compound_setting.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/compound_type.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/curancy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_compound_setting.g.dart';

@JsonSerializable()
class RemoteCompoundsetting {
  final int? id;
  final String? name;
  final RemoteCompoundType? compoundType;
  final String? mobile;
  final String? latitude;
  final String? longitude;
  final String? address;
  final String? logo;
  final RemoteCurrency? currency;
  final String? aboutUs;
  final String? termsConditions;
  final String? faq;
  final String? communityRules;
  final bool? isIncludeTax;
  final bool? isIncludeVat;
  final int? otpRequestCount;
  final int? otpLimitationMinutes;
  final int? badgeExpiredTime;

  const RemoteCompoundsetting({
    this.id,
    this.name,
    this.compoundType,
    this.mobile,
    this.latitude,
    this.longitude,
    this.address,
    this.logo,
    this.currency,
    this.aboutUs,
    this.termsConditions,
    this.faq,
    this.communityRules,
    this.isIncludeTax,
    this.isIncludeVat,
    this.otpRequestCount,
    this.otpLimitationMinutes,
    this.badgeExpiredTime,
  });

  factory RemoteCompoundsetting.fromJson(Map<String, dynamic> json) =>
      _$RemoteCompoundsettingFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteCompoundsettingToJson(this);
}

extension RemoteCompoundsettingX on RemoteCompoundsetting? {
  Compoundsetting toDomain() {
    return Compoundsetting(
      id: this?.id ?? 0,
      name: this?.name ?? '',
      compoundType: this?.compoundType?.toDomain() ?? const CompoundType(),
      mobile: this?.mobile ?? '',
      latitude: this?.latitude ?? '',
      longitude: this?.longitude ?? '',
      address: this?.address ?? '',
      logo: this?.logo ?? '',
      currency: this?.currency?.toDomain() ?? const Currency(),
      aboutUs: this?.aboutUs ?? '',
      termsConditions: this?.termsConditions ?? '',
      faq: this?.faq ?? '',
      communityRules: this?.communityRules ?? '',
      isIncludeTax: this?.isIncludeTax ?? false,
      isIncludeVat: this?.isIncludeVat ?? false,
      otpRequestCount: this?.otpRequestCount ?? 0,
      otpLimitationMinutes: this?.otpLimitationMinutes ?? 0,
      badgeExpiredTime: this?.badgeExpiredTime ?? 0,
    );
  }
}
