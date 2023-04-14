import 'package:json_annotation/json_annotation.dart';
part 'invoice_delivery.g.dart';

@JsonSerializable()
class InvoiceDelivery{
  InvoiceDelivery({
   required this.id,
   required this.invoiceId,
    this.approch,
    this.packaging,
    this.dateValidity,
    this.exportPort,
    this.countryOfOrigin,
    this.grossWeight,
    this.netWeight,
    this.terms,
  });

  late int id;
  late int invoiceId;
  String? approch;
  String? packaging;
  DateTime? dateValidity;
  String? exportPort;
  int? countryOfOrigin;
  num? grossWeight;
  num? netWeight;
  String? terms;

  Map<String, dynamic> toJson() => {
    "id": id,
    "invoiceId": invoiceId,
    "approch": approch,
    "packaging": packaging,
    "dateValidity": dateValidity,
    "exportPort": exportPort,
    "countryOfOrigin": countryOfOrigin,
    "netWeight": netWeight,
    "grossWeight": grossWeight,
    "terms": terms,
  };
  factory InvoiceDelivery.fromJson(Map<String, dynamic> json) => _$InvoiceDeliveryFromJson(json);
}
