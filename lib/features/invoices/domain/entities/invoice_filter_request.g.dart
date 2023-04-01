// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_filter_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceFilterRequest _$InvoiceFilterRequestFromJson(
        Map<String, dynamic> json) =>
    InvoiceFilterRequest(
      filter: json['filter'] == null
          ? null
          : InvoiceFilter.fromJson(json['filter'] as Map<String, dynamic>),
      pageNo: json['pageNo'] as int,
      pageSize: json['pageSize'] as int,
      sortBy: json['sortBy'] as String?,
      sortDir: json['sortDir'] as String?,
    );

Map<String, dynamic> _$InvoiceFilterRequestToJson(
        InvoiceFilterRequest instance) =>
    <String, dynamic>{
      'filter': instance.filter,
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'sortBy': instance.sortBy,
      'sortDir': instance.sortDir,
    };
