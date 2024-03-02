import 'package:city_eye/src/domain/entities/home/checking.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_checking.g.dart';

@JsonSerializable()
final class RemoteChecking {
  final bool? isChecked;

  const RemoteChecking({this.isChecked = false});

  factory RemoteChecking.fromJson(Map<String, dynamic> json) =>
      _$RemoteCheckingFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteCheckingToJson(this);
}

extension RemoteCheckingExtension on RemoteChecking? {
  Checking mapToDomain() => Checking(isChecked: this?.isChecked ?? false);
}
