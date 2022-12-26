// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_lookup_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceLookUpResult _$InvoiceLookUpResultFromJson(Map<String, dynamic> json) =>
    InvoiceLookUpResult(
      invoiceTypes: (json['invoiceTypes'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
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
          countries: (json['countries'] as List<dynamic>)
              .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
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
      unitTypes: (json['unitTypes'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvoiceLookUpResultToJson(
        InvoiceLookUpResult instance) =>
    <String, dynamic>{
      'invoiceTypes': instance.invoiceTypes,
      'countries': instance.countries,
      'branches': instance.branches,
      'paymentTerms': instance.paymentTerms,
      'taxSubTypes': instance.taxSubTypes,
      'taxTypes': instance.taxTypes,
      'currencies': instance.currencies,
      'customers': instance.customers,
      'unitTypes': instance.unitTypes,
      'items': instance.items,
    };
