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
    this.id,
    this.invoiceLineId,
   required this.taxTypeId,
   required this.taxSubTypeId,
  });

  int? id;
  int? invoicelineid;
  int? invoiceLineId;
  num? taxrate;
  num? taxamount;
  String? taxtypecode;
  String? taxsubtypecode;
  int? taxTypeId;
  int? taxSubTypeId;

  Map<String, dynamic> toJson() => {
    "invoicelineid": invoicelineid,
    "invoiceLineId": invoiceLineId,
    "taxrate": taxrate,
    "id": id,
    "taxamount": taxamount,
    "taxtypecode": taxtypecode,
    "taxsubtypecode": taxsubtypecode,
    "taxTypeId": taxTypeId,
    "taxSubTypeId": taxSubTypeId,
  };

  factory LineTax.fromJson(Map<String, dynamic> json) => _$LineTaxFromJson(json);
}
