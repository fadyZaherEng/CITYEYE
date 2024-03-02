import 'package:equatable/equatable.dart';

class HomeSection extends Equatable {
  final int id;
  final String code;
  final bool isvisible;

  const HomeSection({this.id = 0, this.code = "", this.isvisible = false});

  @override
  List<Object?> get props => [id, code, isvisible];
}
