// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_ship_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerShipAddress _$CustomerShipAddressFromJson(Map<String, dynamic> json) =>
    CustomerShipAddress(
      id: json['Id'] as int,
      customerId: json['CustomerId'] as int,
      shipTypeId: json['ShipTypeId'] as int,
      shipTypeName: json['ShipTypeName'] as String?,
      title: json['Title'] as String?,
      countryId: json['CountryId'] as int,
      countryCode: json['CountryCode'] as String?,
      countryName: json['CountryName'] as String?,
      countryNamear: json['CountryNamear'] as String?,
      governateId: json['GovernateId'] as int,
      governateName: json['GovernateName'] as String?,
      governateNamear: json['GovernateNamear'] as String?,
      city: json['City'] as String?,
      street: json['Street'] as String?,
      builldingnumber: json['Builldingnumber'] as String?,
      additionalinformation: json['Additionalinformation'] as String?,
      active: json['Active'] as bool?,
    );

Map<String, dynamic> _$CustomerShipAddressToJson(
        CustomerShipAddress instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'CustomerId': instance.customerId,
      'ShipTypeId': instance.shipTypeId,
      'ShipTypeName': instance.shipTypeName,
      'Title': instance.title,
      'CountryId': instance.countryId,
      'CountryCode': instance.countryCode,
      'CountryName': instance.countryName,
      'countryNamear': instance.countryNamear,
      'GovernateId': instance.governateId,
      'GovernateName': instance.governateName,
      'GovernateNamear': instance.governateNamear,
      'City': instance.city,
      'Street': instance.street,
      'Builldingnumber': instance.builldingnumber,
      'Additionalinformation': instance.additionalinformation,
      'Active': instance.active,
    };
