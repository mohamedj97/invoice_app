// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceFilter _$InvoiceFilterFromJson(Map<String, dynamic> json) =>
    InvoiceFilter(
      freeText: json['freeText'] as String?,
      invoiceNo: json['invoiceNo'] as String?,
      invoiceTypeId: json['invoiceTypeId'] as int?,
      invoiceTypeName: json['invoiceTypeName'] as String?,
      customerId: json['customerId'] as int?,
      customerName: json['customerName'] as String?,
      invoiceDirection: json['invoiceDirection'] as int?,
      statusId: json['statusId'] as int?,
      invoiceDateFrom: json['invoiceDateFrom'] == null
          ? null
          : DateTime.parse(json['invoiceDateFrom'] as String),
      invoiceDateTo: json['invoiceDateTo'] == null
          ? null
          : DateTime.parse(json['invoiceDateTo'] as String),
    );

Map<String, dynamic> _$InvoiceFilterToJson(InvoiceFilter instance) =>
    <String, dynamic>{
      'freeText': instance.freeText,
      'invoiceNo': instance.invoiceNo,
      'invoiceTypeId': instance.invoiceTypeId,
      'invoiceTypeName': instance.invoiceTypeName,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'invoiceDirection': instance.invoiceDirection,
      'statusId': instance.statusId,
      'invoiceDateFrom': instance.invoiceDateFrom?.toIso8601String(),
      'invoiceDateTo': instance.invoiceDateTo?.toIso8601String(),
    };
