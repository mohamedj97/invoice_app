// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_tax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceTax _$InvoiceTaxFromJson(Map<String, dynamic> json) => InvoiceTax(
      id: json['id'] as int,
      invoiceId: json['invoiceId'] as int,
      taxTypeCode: json['taxTypeCode'] as String?,
      taxAmount: json['taxAmount'] as num?,
    );

Map<String, dynamic> _$InvoiceTaxToJson(InvoiceTax instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceId': instance.invoiceId,
      'taxTypeCode': instance.taxTypeCode,
      'taxAmount': instance.taxAmount,
    };
