// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoices_totals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoicesTotals _$InvoicesTotalsFromJson(Map<String, dynamic> json) =>
    InvoicesTotals(
      noOfInvoices: json['noOfInvoices'] as int,
      totalSales: json['totalSales'] as int,
      totalTax: json['totalTax'] as int,
      total: json['total'] as int,
    );

Map<String, dynamic> _$InvoicesTotalsToJson(InvoicesTotals instance) =>
    <String, dynamic>{
      'noOfInvoices': instance.noOfInvoices,
      'totalSales': instance.totalSales,
      'totalTax': instance.totalTax,
      'total': instance.total,
    };
