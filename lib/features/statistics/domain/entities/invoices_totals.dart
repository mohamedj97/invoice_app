import 'package:json_annotation/json_annotation.dart';
part 'invoices_totals.g.dart';

@JsonSerializable()
class InvoicesTotals {
 late int noOfInvoices;
 late int totalSales;
 late int totalTax;
 late int total;


 InvoicesTotals({
    required this.noOfInvoices,
    required this.totalSales,
    required this.totalTax,
    required this.total,
  });

  factory InvoicesTotals.fromJson(Map<String, dynamic> json) =>
      _$InvoicesTotalsFromJson(json);
}
