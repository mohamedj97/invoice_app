// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Line _$LineFromJson(Map<String, dynamic> json) => Line(
      itemId: json['itemId'] as int,
      unitType: json['unitType'] as int,
      quantity: json['quantity'] as num,
      currencyId: json['currencyId'] as int,
      priceEgp: json['priceEgp'] as num,
      id: json['id'] as int?,
      invoiceId: json['invoiceId'] as int?,
      priceSold: json['priceSold'] as num?,
      valueDifference: json['valueDifference'] as num?,
      itemDiscount: json['itemDiscount'] as num?,
      totalTaxableFees: json['totalTaxableFees'] as num?,
      salesTotal: json['salesTotal'] as num?,
      netTotal: json['netTotal'] as num?,
      taxTotal: json['taxTotal'] as num?,
      total: json['total'] as num?,
      addedDate: json['addedDate'] == null
          ? null
          : DateTime.parse(json['addedDate'] as String),
      addedBy: json['addedBy'] as int?,
      updatedDate: json['updatedDate'] == null
          ? null
          : DateTime.parse(json['updatedDate'] as String),
      updatedBy: json['updatedBy'] == null
          ? null
          : DateTime.parse(json['updatedBy'] as String),
      removed: json['removed'] as bool?,
      removedDate: json['removedDate'] == null
          ? null
          : DateTime.parse(json['removedDate'] as String),
      removedBy: json['removedBy'] as int?,
      lineTax: (json['lineTax'] as List<dynamic>?)
          ?.map((e) => LineTax.fromJson(e as Map<String, dynamic>))
          .toList(),
      lineTotal: json['lineTotal'] == null
          ? null
          : LineTotal.fromJson(json['lineTotal'] as Map<String, dynamic>),
      itemDescription: json['itemDescription'] as String,
      exchangeRate: json['exchangeRate'] as num?,
      discountRate: json['discountRate'] as num?,
      discountAmount: json['discountAmount'] as num?,
    );

Map<String, dynamic> _$LineToJson(Line instance) => <String, dynamic>{
      'itemId': instance.itemId,
      'unitType': instance.unitType,
      'quantity': instance.quantity,
      'currencyId': instance.currencyId,
      'priceEgp': instance.priceEgp,
      'id': instance.id,
      'invoiceId': instance.invoiceId,
      'priceSold': instance.priceSold,
      'valueDifference': instance.valueDifference,
      'itemDiscount': instance.itemDiscount,
      'totalTaxableFees': instance.totalTaxableFees,
      'salesTotal': instance.salesTotal,
      'netTotal': instance.netTotal,
      'taxTotal': instance.taxTotal,
      'total': instance.total,
      'addedDate': instance.addedDate?.toIso8601String(),
      'addedBy': instance.addedBy,
      'updatedDate': instance.updatedDate?.toIso8601String(),
      'updatedBy': instance.updatedBy?.toIso8601String(),
      'removed': instance.removed,
      'removedDate': instance.removedDate?.toIso8601String(),
      'removedBy': instance.removedBy,
      'lineTax': instance.lineTax,
      'lineTotal': instance.lineTotal,
      'itemDescription': instance.itemDescription,
      'exchangeRate': instance.exchangeRate,
      'discountRate': instance.discountRate,
      'discountAmount': instance.discountAmount,
    };
