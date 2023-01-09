import 'package:json_annotation/json_annotation.dart';
part 'invoices_totals.g.dart';

@JsonSerializable()
class InvoicesTotals {
 late num noOfInvoices;
 late num totalSales;
 late num totalTax;
 late num total;


 InvoicesTotals({
    required this.noOfInvoices,
    required this.totalSales,
    required this.totalTax,
    required this.total,
  });

  factory InvoicesTotals.fromJson(Map<String, dynamic> json) =>
      _$InvoicesTotalsFromJson(json);
}
