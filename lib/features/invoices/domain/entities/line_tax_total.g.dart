// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_tax_total.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LineTaxTotal _$LineTaxTotalFromJson(Map<String, dynamic> json) => LineTaxTotal(
      taxType: json['taxType'] as String,
      amount: json['amount'] as num,
    );

Map<String, dynamic> _$LineTaxTotalToJson(LineTaxTotal instance) =>
    <String, dynamic>{
      'taxType': instance.taxType,
      'amount': instance.amount,
    };
