import 'package:json_annotation/json_annotation.dart';
part 'invoice_tax.g.dart';

@JsonSerializable()
class InvoiceTax{
  InvoiceTax({
    required this.id,
    required this.invoiceId,
    this.taxTypeCode,
    this.taxAmount,
  });

  late int id;
  late int invoiceId;
  String? taxTypeCode;
  num? taxAmount;

  Map<String, dynamic> toJson() => {
    "id": id,
    "invoiceId": invoiceId,
    "taxTypeCode": taxTypeCode,
    "taxAmount": taxAmount,
  };

  factory InvoiceTax.fromJson(Map<String, dynamic> json) => _$InvoiceTaxFromJson(json);
}
