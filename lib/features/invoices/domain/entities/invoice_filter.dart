import 'package:json_annotation/json_annotation.dart';
part 'invoice_filter.g.dart';

@JsonSerializable()
class InvoiceFilter{
  InvoiceFilter({
    this.freeText,
    this.invoiceNo,
    this.invoiceTypeId,
    this.invoiceTypeName,
    this.customerId,
    this.customerName,
    this.invoiceDirection,
    this.statusId,
    this.invoiceDateFrom,
    this.invoiceDateTo,
  });

  String? freeText;
  String? invoiceNo;
  int? invoiceTypeId;
  String? invoiceTypeName;
  int? customerId;
  String? customerName;
  int? invoiceDirection;
  int? statusId;
  DateTime? invoiceDateFrom;
  DateTime? invoiceDateTo;

  factory InvoiceFilter.fromJson(Map<String, dynamic> json) => _$InvoiceFilterFromJson(json);
}
