import 'package:json_annotation/json_annotation.dart';

part 'line_tax_total.g.dart';

@JsonSerializable()
class LineTaxTotal {
  LineTaxTotal({
   required this.taxType,
   required this.amount,
  });

  String taxType;
  num amount;

  Map<String, dynamic> toJson() => {
    "taxType": taxType,
    "amount": amount,
  };

  factory LineTaxTotal.fromJson(Map<String, dynamic> json) => _$LineTaxTotalFromJson(json);
}
