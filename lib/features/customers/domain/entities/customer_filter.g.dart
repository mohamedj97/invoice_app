// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerFilter _$CustomerFilterFromJson(Map<String, dynamic> json) =>
    CustomerFilter(
      freeText: json['freeText'] as String?,
      customerType: json['customerType'] as int?,
      country: json['country'] as int?,
      identityId: json['identityId'] as int?,
      active: json['active'] as bool?,
      customerName: json['customerName'] as String?,
    );

Map<String, dynamic> _$CustomerFilterToJson(CustomerFilter instance) =>
    <String, dynamic>{
      'freeText': instance.freeText,
      'customerType': instance.customerType,
      'customerName': instance.customerName,
      'country': instance.country,
      'identityId': instance.identityId,
      'active': instance.active,
    };
