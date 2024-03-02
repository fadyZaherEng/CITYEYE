import 'package:city_eye/src/domain/entities/home/city_eye/compound_type.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/curancy.dart';
import 'package:equatable/equatable.dart';

class Compoundsetting extends Equatable {
  final int id;
  final String name;
  final CompoundType compoundType;
  final String mobile;
  final String latitude;
  final String longitude;
  final String address;
  final String logo;
  final Currency currency;
  final String aboutUs;
  final String termsConditions;
  final String faq;
  final String communityRules;
  final bool isIncludeTax;
  final bool isIncludeVat;
  final int otpRequestCount;
  final int otpLimitationMinutes;
  final int badgeExpiredTime;

  const Compoundsetting({
    this.id = 0,
    this.name = '',
    this.compoundType = const CompoundType(),
    this.mobile = '',
    this.latitude = '',
    this.longitude = '',
    this.address = '',
    this.logo = '',
    this.currency = const Currency(),
    this.aboutUs = '',
    this.termsConditions = '',
    this.faq = '',
    this.communityRules = '',
    this.isIncludeTax = false,
    this.isIncludeVat = false,
    this.otpRequestCount = 0,
    this.otpLimitationMinutes = 0,
    this.badgeExpiredTime = 0,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        compoundType,
        mobile,
        latitude,
        longitude,
        address,
        logo,
        currency,
        aboutUs,
        termsConditions,
        faq,
        communityRules,
        isIncludeTax,
        isIncludeVat,
        otpRequestCount,
        otpLimitationMinutes,
        badgeExpiredTime
      ];
}
