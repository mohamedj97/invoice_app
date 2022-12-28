// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceFilterModel _$InvoiceFilterModelFromJson(Map<String, dynamic> json) =>
    InvoiceFilterModel(
      freeText: json['freeText'] as String?,
      invoiceDate: json['invoiceDate'] == null
          ? null
          : DateTime.parse(json['invoiceDate'] as String),
      invoiceTypeId: json['invoiceTypeId'] as int?,
      invoiceTypeName: json['invoiceTypeName'] as String?,
      invoiceDirection: json['invoiceDirection'] as int?,
      customerName: json['customerName'] as String?,
      customerId: json['customerId'] as int?,
      status: json['status'] as String?,
      invoiceNo: json['invoiceNo'] as String?,
    );

Map<String, dynamic> _$InvoiceFilterModelToJson(InvoiceFilterModel instance) =>
    <String, dynamic>{
      'freeText': instance.freeText,
      'invoiceNo': instance.invoiceNo,
      'invoiceDate': instance.invoiceDate?.toIso8601String(),
      'invoiceTypeId': instance.invoiceTypeId,
      'invoiceTypeName': instance.invoiceTypeName,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'invoiceDirection': instance.invoiceDirection,
      'status': instance.status,
    };
