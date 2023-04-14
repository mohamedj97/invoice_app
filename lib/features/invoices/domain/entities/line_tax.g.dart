// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_tax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LineTax _$LineTaxFromJson(Map<String, dynamic> json) => LineTax(
      invoicelineid: json['invoicelineid'] as int?,
      taxrate: json['taxrate'] as num?,
      taxamount: json['taxamount'] as num?,
      taxtypecode: json['taxtypecode'] as String?,
      taxsubtypecode: json['taxsubtypecode'] as String?,
      id: json['id'] as int?,
      invoiceLineId: json['invoiceLineId'] as int?,
      taxTypeId: json['taxTypeId'] as int?,
      taxSubTypeId: json['taxSubTypeId'] as int?,
    );

Map<String, dynamic> _$LineTaxToJson(LineTax instance) => <String, dynamic>{
      'id': instance.id,
      'invoicelineid': instance.invoicelineid,
      'invoiceLineId': instance.invoiceLineId,
      'taxrate': instance.taxrate,
      'taxamount': instance.taxamount,
      'taxtypecode': instance.taxtypecode,
      'taxsubtypecode': instance.taxsubtypecode,
      'taxTypeId': instance.taxTypeId,
      'taxSubTypeId': instance.taxSubTypeId,
    };
