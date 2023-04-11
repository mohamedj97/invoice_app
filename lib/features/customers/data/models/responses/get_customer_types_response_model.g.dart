// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_customer_types_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCustomerTypesResponseDataModel _$GetCustomerTypesResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    GetCustomerTypesResponseDataModel(
      metaData: (json['metaData'] as List<dynamic>)
          .map((e) => Meta.fromJson(e as Map<String, dynamic>))
          .toList(),
      customerType: (json['customerType'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      countries: (json['countries'] as List<dynamic>)
          .map((e) => LookupCode.fromJson(e as Map<String, dynamic>))
          .toList(),
      currencies: (json['currencies'] as List<dynamic>)
          .map((e) => LookupCode.fromJson(e as Map<String, dynamic>))
          .toList(),
      taxTypes: (json['taxTypes'] as List<dynamic>)
          .map((e) => LookupCode.fromJson(e as Map<String, dynamic>))
          .toList(),
      shipTypes: (json['shipTypes'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      governates: (json['governates'] as List<dynamic>)
          .map((e) => GovernateLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      taxSubTypes: (json['taxSubTypes'] as List<dynamic>)
          .map((e) => TaxSubtypeLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCustomerTypesResponseDataModelToJson(
        GetCustomerTypesResponseDataModel instance) =>
    <String, dynamic>{
      'metaData': instance.metaData,
      'customerType': instance.customerType,
      'countries': instance.countries,
      'currencies': instance.currencies,
      'taxTypes': instance.taxTypes,
      'shipTypes': instance.shipTypes,
      'governates': instance.governates,
      'items': instance.items,
      'taxSubTypes': instance.taxSubTypes,
    };

GetCustomerTypesResponse _$GetCustomerTypesResponseFromJson(
        Map<String, dynamic> json) =>
    GetCustomerTypesResponse(
      statuscode: json['statuscode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      result: json['result'] == null
          ? null
          : GetCustomerTypesResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCustomerTypesResponseToJson(
        GetCustomerTypesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
