import 'package:city_eye/src/domain/entities/home/security/service_package.dart';
import 'package:equatable/equatable.dart';

class ServiceScanned extends Equatable {
  final int id;
  final ServicePackages servicePackages;
  final int serviceCount;
  final int price;
  final int discount;
  final int totalPrice;
  final int sessionNo;
  final String qrImage;
  final int pinCode;

  const ServiceScanned({
    this.id = 0,
    this.servicePackages = const ServicePackages(),
    this.serviceCount = 0,
    this.price = 0,
    this.discount = 0,
    this.totalPrice = 0,
    this.sessionNo = 0,
    this.qrImage = '',
    this.pinCode = 0,
  });

  @override
  List<Object?> get props => [
        id,
        servicePackages,
        serviceCount,
        price,
        discount,
        totalPrice,
        sessionNo,
        qrImage,
        pinCode,
      ];
}
