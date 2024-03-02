// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteServices _$RemoteServicesFromJson(Map<String, dynamic> json) =>
    RemoteServices(
      id: json['id'] as int?,
      servicePackages: json['servicePackages'] == null
          ? null
          : RemoteServicePackages.fromJson(
              json['servicePackages'] as Map<String, dynamic>),
      serviceCount: json['serviceCount'] as int?,
      price: json['price'] as int?,
      discount: json['discount'] as int?,
      totalPrice: json['totalPrice'] as int?,
      sessionNo: json['sessionNo'] as int?,
      qrImage: json['qrImage'] as String?,
      pinCode: json['pinCode'] as int?,
    );

Map<String, dynamic> _$RemoteServicesToJson(RemoteServices instance) =>
    <String, dynamic>{
      'id': instance.id,
      'servicePackages': instance.servicePackages,
      'serviceCount': instance.serviceCount,
      'price': instance.price,
      'discount': instance.discount,
      'totalPrice': instance.totalPrice,
      'sessionNo': instance.sessionNo,
      'qrImage': instance.qrImage,
      'pinCode': instance.pinCode,
    };
