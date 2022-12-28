import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'line_tax.dart';
import 'line_total.dart';

part 'invoice_line.g.dart';

@JsonSerializable()
class Line {
  Line({
    required this.itemDescription,
    this.exchangeRate,
    this.discountRate,
    this.discountAmount,
    required this.itemId,
    required this.unitType,
    required this.quantity,
    required this.currencyId,
    required this.priceEgp,
    this.lineTax,
   required this.lineTotal,
  });

  String itemDescription;
  int? exchangeRate;
  num? discountRate;
  int? discountAmount;
  int itemId;
  int unitType;
  num quantity;
  int currencyId;
  num priceEgp;
  List<LineTax>? lineTax;
  LineTotal lineTotal;

  Map<String, dynamic> toJson() => {
    "ItemDescription": itemDescription,
    "ExchangeRate": exchangeRate,
    "DiscountRate": discountRate,
    "DiscountAmount": discountAmount,
    "ItemId": itemId,
    "UnitType": unitType,
    "Quantity": quantity,
    "CurrencyId": currencyId,
    "PriceEgp": priceEgp,
    "LineTax": lineTax?.map((e) => e.toJson()).toList() ??[],
    "LineTotal": lineTotal.toJson(),
  };
  factory Line.fromJson(Map<String, dynamic> json) => _$LineFromJson(json);
}
