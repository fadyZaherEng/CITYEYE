import 'dart:ui';

import 'package:equatable/equatable.dart';

class ChartModel extends Equatable {
  String xAxisValue;
  double yAxisValue;
  String? label;
  Color? labelColor;

  ChartModel({
    required this.xAxisValue,
    required this.yAxisValue,
    this.label,
    this.labelColor,
  });

  List<Object?> get props => [
        xAxisValue,
        yAxisValue,
        label,
        labelColor,
      ];
}
