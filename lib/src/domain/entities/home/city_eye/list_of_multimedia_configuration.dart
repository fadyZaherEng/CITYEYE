import 'package:city_eye/src/domain/entities/home/city_eye/compound_multimedia_type_configurations.dart';
import 'package:equatable/equatable.dart';

class ListOfMultiMediaConfiguration extends Equatable {
  final int id;
  final int pageId;
  final String pageCode;
  final List<CompoundMultiMediaConfigrationDtos>
      compoundMultiMediaConfigrationDtos;

  const ListOfMultiMediaConfiguration({
    this.id = 0,
    this.pageId = 0,
    this.pageCode = '',
    this.compoundMultiMediaConfigrationDtos = const [],
  });

  @override
  List<Object?> get props =>
      [id, pageId, pageCode, compoundMultiMediaConfigrationDtos];
}
