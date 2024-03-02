import 'package:city_eye/src/data/sources/remote/home/entity/compound_configuration/remote_list_of_multimedia_configuration.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/compound_setting.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/list_of_multimedia_configuration.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/list_page_section.dart';
import 'package:city_eye/src/domain/entities/home/city_eye/list_social_media.dart';
import 'package:equatable/equatable.dart';

class GetCompoundConfiguration extends Equatable {
  final int vat;
  final int tax;
  final List<ListOfMultiMediaConfiguration> listOfMultiMediaConfiguration;
  final List<ListSocialMedia> listSocialMedia;
  final List<ListOfPageSections> listOfPageSections;
  final Compoundsetting compoundsetting;

  const GetCompoundConfiguration({
    this.vat = 0,
    this.tax = 0,
    this.listOfMultiMediaConfiguration = const [],
    this.listSocialMedia = const [],
    this.listOfPageSections = const [],
    this.compoundsetting = const Compoundsetting(),
  });

  @override
  List<Object?> get props => [
        vat,
        tax,
        listOfMultiMediaConfiguration,
        listSocialMedia,
        listOfPageSections,
        compoundsetting,
      ];
}
