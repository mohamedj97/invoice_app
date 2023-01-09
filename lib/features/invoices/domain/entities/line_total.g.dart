// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_total.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LineTotal _$LineTotalFromJson(Map<String, dynamic> json) => LineTotal(
      salesTotal: json['salesTotal'] as num?,
      netTotal: json['netTotal'] as num?,
      total: json['total'] as num?,
      lineTaxTotal: (json['lineTaxTotal'] as List<dynamic>?)
          ?.map((e) => LineTaxTotal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LineTotalToJson(LineTotal instance) => <String, dynamic>{
      'salesTotal': instance.salesTotal,
      'netTotal': instance.netTotal,
      'total': instance.total,
      'lineTaxTotal': instance.lineTaxTotal,
    };
