import 'package:equatable/equatable.dart';

class MultiMediaTypes extends Equatable {
  final int id;
  final bool isVisible;
  final String code;

  const MultiMediaTypes({
    this.id = 0,
    this.isVisible = false,
    this.code = '',
  });

  @override
  List<Object?> get props => [id, isVisible, code];
}
