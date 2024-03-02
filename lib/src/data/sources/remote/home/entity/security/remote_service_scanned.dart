import 'package:city_eye/src/data/sources/remote/home/entity/security/remote_service_package.dart';
import 'package:city_eye/src/domain/entities/home/security/service_package.dart';
import 'package:city_eye/src/domain/entities/home/security/service_scanned.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_service_scanned.g.dart';

@JsonSerializable()
class RemoteServiceScanned {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'servicePackages')
  final RemoteServicePackages? servicePackages;
  @JsonKey(name: 'serviceCount')
  final int? serviceCount;
  @JsonKey(name: 'price')
  final int? price;
  @JsonKey(name: 'discount')
  final int? discount;
  @JsonKey(name: 'totalPrice')
  final int? totalPrice;
  @JsonKey(name: 'sessionNo')
  final int? sessionNo;
  @JsonKey(name: 'qrImage')
  final String? qrImage;
  @JsonKey(name: 'pinCode')
  final int? pinCode;

  const RemoteServiceScanned({
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

  factory RemoteServiceScanned.fromJson(Map<String, dynamic> json) =>
      _$RemoteServiceScannedFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteServiceScannedToJson(this);
}

extension RemoteServiceScannedExtention on RemoteServiceScanned? {
  ServiceScanned mapToDomain() {
    return ServiceScanned(
      discount: this?.discount ?? 0,
      id: this?.id ?? 0,
      servicePackages:
          this?.servicePackages?.mapToDomain() ?? const ServicePackages(),
      pinCode: this?.pinCode ?? 0,
      price: this?.price ?? 0,
      qrImage: this?.qrImage ?? "",
      sessionNo: this?.sessionNo ?? 0,
      serviceCount: this?.serviceCount ?? 0,
      totalPrice: this?.totalPrice ?? 0,
    );
  }
}
