// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_invoices_types_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetInvoiceTypesResponseDataModel _$GetInvoiceTypesResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    GetInvoiceTypesResponseDataModel(
          invoiceType: (json['invoiceType'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
          status: (json['status'] as List<dynamic>)
              .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
              .toList(),
      metaData: (json['metaData'] as List<dynamic>)
          .map((e) => Meta.fromJson(e as Map<String, dynamic>))
          .toList(),
      branches: (json['branches'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentTerms: (json['paymentTerms'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      taxTypes: (json['taxTypes'] as List<dynamic>)
          .map((e) => LookupCode.fromJson(e as Map<String, dynamic>))
          .toList(),
      taxSubTypes: (json['taxSubTypes'] as List<dynamic>)
          .map((e) => TaxSubtypeLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      customers: (json['customers'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      currencies: (json['currencies'] as List<dynamic>)
          .map((e) => LookupCode.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>)
          .map((e) => ItemLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      countries: (json['countries'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      unitTypes: (json['unitTypes'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetInvoiceTypesResponseDataModelToJson(
        GetInvoiceTypesResponseDataModel instance) =>
    <String, dynamic>{
      'invoiceType': instance.invoiceType,
      'branches': instance.branches,
      'paymentTerms': instance.paymentTerms,
      'taxSubTypes': instance.taxSubTypes,
      'taxTypes': instance.taxTypes,
      'currencies': instance.currencies,
      'countries': instance.countries,
      'customers': instance.customers,
      'unitTypes': instance.unitTypes,
      'items': instance.items,
      'metaData': instance.metaData,
    };

GetInvoiceTypesResponse _$GetInvoiceTypesResponseFromJson(
        Map<String, dynamic> json) =>
    GetInvoiceTypesResponse(
      statuscode: json['statuscode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      result: json['result'] == null
          ? null
          : GetInvoiceTypesResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetInvoiceTypesResponseToJson(
        GetInvoiceTypesResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
