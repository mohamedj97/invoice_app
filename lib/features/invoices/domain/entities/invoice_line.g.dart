// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Line _$LineFromJson(Map<String, dynamic> json) => Line(
      itemDescription: json['itemDescription'] as String,
      exchangeRate: json['exchangeRate'] as num?,
      discountRate: json['discountRate'] as num?,
      discountAmount: json['discountAmount'] as num?,
      itemId: json['itemId'] as int,
      unitType: json['unitType'] as int,
      quantity: json['quantity'] as num,
      currencyId: json['currencyId'] as int,
      priceEgp: json['priceEgp'] as num,
      lineTax: (json['lineTax'] as List<dynamic>?)
          ?.map((e) => LineTax.fromJson(e as Map<String, dynamic>))
          .toList(),
      lineTotal: json['lineTotal'] == null
          ? null
          : LineTotal.fromJson(json['lineTotal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LineToJson(Line instance) => <String, dynamic>{
      'itemDescription': instance.itemDescription,
      'exchangeRate': instance.exchangeRate,
      'discountRate': instance.discountRate,
      'discountAmount': instance.discountAmount,
      'itemId': instance.itemId,
      'unitType': instance.unitType,
      'quantity': instance.quantity,
      'currencyId': instance.currencyId,
      'priceEgp': instance.priceEgp,
      'lineTax': instance.lineTax,
      'lineTotal': jsonEncode(instance.lineTotal?.toJson()),
    };
