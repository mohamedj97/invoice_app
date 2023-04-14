import 'package:json_annotation/json_annotation.dart';
part 'invoice_payment.g.dart';

@JsonSerializable()
class InvoicePayment{
  InvoicePayment({
    required this.id,
    required this.invoiceId,
    this.bankname,
    this.bankaddress,
    this.bankaccountno,
    this.bankaccountiban,
    this.swiftcode,
    this.terms,
  });

  late int id;
  late int invoiceId;
  String? bankname;
  String? bankaddress;
  String? bankaccountno;
  String? bankaccountiban;
  String? swiftcode;
  String? terms;

  Map<String, dynamic> toJson() => {
    "id": id,
    "invoiceId": invoiceId,
    "bankname": bankname,
    "bankaddress": bankaddress,
    "bankaccountno": bankaccountno,
    "bankaccountiban": bankaccountiban,
    "swiftcode": swiftcode,
    "terms": terms,
  };
  factory InvoicePayment.fromJson(Map<String, dynamic> json) => _$InvoicePaymentFromJson(json);
}
