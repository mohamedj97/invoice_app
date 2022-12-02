// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_ship_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerShipAddress _$CustomerShipAddressFromJson(Map<String, dynamic> json) =>
    CustomerShipAddress(
      id: json['id'] as int,
      customerId: json['customerId'] as int,
      shipTypeId: json['shipTypeId'] as int,
      shipTypeName: json['shipTypeName'] as String?,
      title: json['title'] as String?,
      countryId: json['countryId'] as int,
      countryCode: json['countryCode'] as String?,
      countryName: json['countryName'] as String?,
      countryNamear: json['countryNamear'] as String?,
      governateId: json['governateId'] as int,
      governateName: json['governateName'] as String?,
      governateNamear: json['governateNamear'] as String?,
      city: json['city'] as String?,
      street: json['street'] as String?,
      builldingnumber: json['builldingnumber'] as String?,
      additionalinformation: json['additionalinformation'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$CustomerShipAddressToJson(
        CustomerShipAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'shipTypeId': instance.shipTypeId,
      'shipTypeName': instance.shipTypeName,
      'title': instance.title,
      'countryId': instance.countryId,
      'countryCode': instance.countryCode,
      'countryName': instance.countryName,
      'countryNamear': instance.countryNamear,
      'governateId': instance.governateId,
      'governateName': instance.governateName,
      'governateNamear': instance.governateNamear,
      'city': instance.city,
      'street': instance.street,
      'builldingnumber': instance.builldingnumber,
      'additionalinformation': instance.additionalinformation,
      'active': instance.active,
    };
