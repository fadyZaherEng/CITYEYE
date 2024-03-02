import 'package:city_eye/src/domain/entities/home/city_eye/multimedia_type.dart';
import 'package:equatable/equatable.dart';

class ListOfPageSections extends Equatable {
  final int id;
  final int pageId;
  final String pageCode;
  final List<MultiMediaTypes> multiMediaTypes;

  const ListOfPageSections({
    this.id = 0,
    this.pageId = 0,
    this.pageCode = '',
    this.multiMediaTypes = const [],
  });

  @override
  List<Object?> get props => [id, pageId, pageCode, multiMediaTypes];
}
