// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_invoices_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceFilterGenericFilterModel _$InvoiceFilterGenericFilterModelFromJson(
        Map<String, dynamic> json) =>
    InvoiceFilterGenericFilterModel(
      sortBy: json['sortBy'] as String?,
      sortDir: json['sortDir'] as String?,
      filter: json['filter'] == null
          ? null
          : InvoiceFilter.fromJson(json['filter'] as Map<String, dynamic>),
      pageNo: json['pageNo'] as int,
      pageSize: json['pageSize'] as int,
    );

Map<String, dynamic> _$InvoiceFilterGenericFilterModelToJson(
        InvoiceFilterGenericFilterModel instance) =>
    <String, dynamic>{
      'filter': instance.filter?.toJson(),
      'pageNo': instance.pageNo,
      'pageSize': instance.pageSize,
      'sortBy': instance.sortBy,
      'sortDir': instance.sortDir,
    };
