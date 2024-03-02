import 'package:city_eye/src/domain/entities/home/city_eye/get_offers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_get_offers.g.dart';

@JsonSerializable()
class RemoteGetOffers {
  final int? id;
  final String? title;
  final String? description;
  final bool? iSRedirectURL;
  final String? redirectURL;
  final String? startDate;
  final String? endDate;
  final String? attachment;
  final dynamic destinationMobilePages;
  final int? destinationSourceId;

  const RemoteGetOffers({
    this.id = 0,
    this.title = "",
    this.description = "",
    this.iSRedirectURL = false,
    this.redirectURL = "",
    this.startDate = "",
    this.endDate = "",
    this.attachment = "",
    this.destinationMobilePages = "",
    this.destinationSourceId = 0,
  });

  factory RemoteGetOffers.fromJson(Map<String, dynamic> json) =>
      _$RemoteGetOffersFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteGetOffersToJson(this);
}

extension RemoteGetOffersExtension on RemoteGetOffers? {
  GetOffers mapToDomain() => GetOffers(
        id: this?.id ?? 0,
        title: this?.title ?? "",
        description: this?.description ?? "",
        iSRedirectURL: this?.iSRedirectURL ?? false,
        redirectURL: this?.redirectURL ?? "",
        startDate: this?.startDate ?? "",
        endDate: this?.endDate ?? "",
        attachment: this?.attachment ?? "",
        destinationMobilePages: this?.destinationMobilePages ?? "",
        destinationSourceId: this?.destinationSourceId ?? 0,
      );
}

extension GetOfferListExtension on List<RemoteGetOffers>? {
  List<GetOffers> mapToDomain() =>
      this?.map((e) => e.mapToDomain()).toList() ?? [];
}
