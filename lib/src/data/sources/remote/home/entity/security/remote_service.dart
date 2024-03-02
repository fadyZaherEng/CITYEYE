import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_service_package.dart';
import 'package:city_eye/src/domain/entities/home/security/service.dart';
import 'package:city_eye/src/domain/entities/home/security/service_package.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_service.g.dart';

@JsonSerializable()
class RemoteServices {
  final int? id;
  final RemoteServicePackages? servicePackages;
  final int? serviceCount;
  final int? price;
  final int? discount;
  final int? totalPrice;
  final int? sessionNo;
  final String? qrImage;
  final int? pinCode;

  const RemoteServices({
    this.id,
    this.servicePackages,
    this.serviceCount,
    this.price,
    this.discount,
    this.totalPrice,
    this.sessionNo,
    this.qrImage,
    this.pinCode,
  });

  factory RemoteServices.fromJson(Map<String, dynamic> json) =>
      _$RemoteServicesFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteServicesToJson(this);
}

extension RemoteServicesExtention on RemoteServices? {
  Services mapToDomain() {
    return Services(
      id: this?.id ?? 0,
      discount: this?.discount ?? 0,
      pinCode: this?.pinCode ?? 0,
      price: this?.price ?? 0,
      serviceCount: this?.serviceCount ?? 0,
      qrImage: this?.qrImage ?? "",
      sessionNo: this?.sessionNo ?? 0,
      totalPrice: this?.totalPrice ?? 0,
      servicePackages:
          this?.servicePackages?.mapToDomain() ?? const ServicePackages(),
    );
  }
}
