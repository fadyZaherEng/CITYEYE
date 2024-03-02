import 'package:city_eye/src/domain/entities/home/city_eye/media_types.dart';
import 'package:equatable/equatable.dart';

class CompoundMultiMediaConfigrationDtos extends Equatable {
  final int id;
  final bool isVisible;
  final int minCount;
  final int maxCount;
  final int maxTime;
  final int maxSize;
  final bool isMulti;
  final MultiMediaType multiMediaType;

  const CompoundMultiMediaConfigrationDtos({
    this.id = 0,
    this.isVisible = false,
    this.minCount = 0,
    this.maxCount = 0,
    this.maxTime = 0,
    this.maxSize = 0,
    this.isMulti = false,
    this.multiMediaType = const MultiMediaType(),
  });

  @override
  List<Object?> get props => [
        id,
        isVisible,
        minCount,
        maxCount,
        maxTime,
        maxSize,
        isMulti,
        multiMediaType
      ];
}
