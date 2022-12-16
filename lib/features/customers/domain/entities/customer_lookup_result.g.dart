// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_lookup_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerLookUpResult _$CustomerLookUpResultFromJson(
        Map<String, dynamic> json) =>
    CustomerLookUpResult(
      customerTypes: (json['customerTypes'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      countries: (json['countries'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      governates: (json['governates'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      currencies: (json['currencies'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      taxTypes: (json['taxTypes'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      taxSubTypes: (json['taxSubTypes'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      shipTypes: (json['shipTypes'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerLookUpResultToJson(
        CustomerLookUpResult instance) =>
    <String, dynamic>{
      'customerTypes': instance.customerTypes,
      'countries': instance.countries,
      'governates': instance.governates,
      'items': instance.items,
      'currencies': instance.currencies,
      'taxTypes': instance.taxTypes,
      'taxSubTypes': instance.taxSubTypes,
      'shipTypes': instance.shipTypes,
    };
