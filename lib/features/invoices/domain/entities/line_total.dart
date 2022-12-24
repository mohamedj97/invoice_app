import 'package:json_annotation/json_annotation.dart';

import 'line_tax_total.dart';

part 'line_total.g.dart';

@JsonSerializable()
class LineTotal {
  LineTotal({
  required  this.salesTotal,
  required this.netTotal,
  required this.total,
    this.lineTaxTotal,
  });

  num salesTotal;
  num netTotal;
  num total;
  List<LineTaxTotal>? lineTaxTotal;

  factory LineTotal.fromJson(Map<String, dynamic> json) => _$LineTotalFromJson(json);
}
