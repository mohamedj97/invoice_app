// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoices_totals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoicesTotals _$InvoicesTotalsFromJson(Map<String, dynamic> json) =>
    InvoicesTotals(
      noOfInvoices: json['noOfInvoices'] as num,
      totalSales: json['totalSales'] as num,
      totalTax: json['totalTax'] as num,
      total: json['total'] as num,
    );

Map<String, dynamic> _$InvoicesTotalsToJson(InvoicesTotals instance) =>
    <String, dynamic>{
      'noOfInvoices': instance.noOfInvoices,
      'totalSales': instance.totalSales,
      'totalTax': instance.totalTax,
      'total': instance.total,
    };
