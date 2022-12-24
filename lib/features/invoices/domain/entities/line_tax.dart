import 'package:json_annotation/json_annotation.dart';

part 'line_tax.g.dart';

@JsonSerializable()
class LineTax {
  LineTax({
   required this.invoicelineid,
    this.taxrate,
    this.taxamount,
    this.taxtypecode,
    this.taxsubtypecode,
   required this.taxTypeId,
   required this.taxSubTypeId,
  });

  int invoicelineid;
  num? taxrate;
  num? taxamount;
  String? taxtypecode;
  String? taxsubtypecode;
  int taxTypeId;
  int taxSubTypeId;

  factory LineTax.fromJson(Map<String, dynamic> json) => _$LineTaxFromJson(json);
}
