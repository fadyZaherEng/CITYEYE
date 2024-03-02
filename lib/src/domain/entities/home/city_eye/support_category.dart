import 'package:equatable/equatable.dart';

class SupportCategory extends Equatable {
  final int id;
  final String name;
  final String code;
  final String logo;
  final int sortNo;

  const SupportCategory({
    this.id = 0,
    this.name = "",
    this.code = "",
    this.logo = "",
    this.sortNo = 0,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        code,
        logo,
        sortNo,
      ];
}
