import 'package:equatable/equatable.dart';

class GetOffers extends Equatable {
  final int id;
  final String title;
  final String description;
  final bool iSRedirectURL;
  final String redirectURL;
  final String startDate;
  final String endDate;
  final String attachment;
  final dynamic destinationMobilePages;
  final int destinationSourceId;

  const GetOffers({
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

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        iSRedirectURL,
        redirectURL,
        startDate,
        endDate,
        attachment,
        destinationMobilePages,
        destinationSourceId,
      ];
}
