// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_head_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceHeadModel _$InvoiceHeadModelFromJson(Map<String, dynamic> json) =>
    InvoiceHeadModel(
      id: json['id'] as int,
      invoiceDate: DateTime.parse(json['invoiceDate'] as String),
      direction: json['direction'] as String?,
      status: json['status'] as String?,
      invoiceNo: json['invoiceNo'] as String?,
      invoiceType: json['invoiceType'] as String?,
      customerCode: json['customerCode'] as String?,
      customerName: json['customerName'] as String?,
      customerTaxRegId: json['customerTaxRegId'] as String?,
      customerCountry: json['customerCountry'] as String?,
      totalSalesAmount: json['totalSalesAmount'] as num?,
      totalDiscountAmount: json['totalDiscountAmount'] as num?,
      netAmount: json['netAmount'] as num?,
      totalTaxAmount: json['totalTaxAmount'] as num?,
      totalAmount: json['totalAmount'] as num?,
      invoiceLinesCount: json['invoiceLinesCount'] as int?,
    );

Map<String, dynamic> _$InvoiceHeadModelToJson(InvoiceHeadModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoiceDate': instance.invoiceDate.toIso8601String(),
      'direction': instance.direction,
      'status': instance.status,
      'invoiceNo': instance.invoiceNo,
      'invoiceType': instance.invoiceType,
      'customerCode': instance.customerCode,
      'customerName': instance.customerName,
      'customerTaxRegId': instance.customerTaxRegId,
      'customerCountry': instance.customerCountry,
      'totalSalesAmount': instance.totalSalesAmount,
      'totalDiscountAmount': instance.totalDiscountAmount,
      'netAmount': instance.netAmount,
      'totalTaxAmount': instance.totalTaxAmount,
      'totalAmount': instance.totalAmount,
      'invoiceLinesCount': instance.invoiceLinesCount,
    };
