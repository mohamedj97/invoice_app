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

  Map<String, dynamic> toJson() => {
    "freeText": freeText,
    "invoiceNo": invoiceNo,
    "invoiceTypeId": invoiceTypeId,
    "invoiceTypeName": invoiceTypeName,
    "customerId": customerId,
    "customerName": customerName,
    "invoiceDirection": invoiceDirection,
    "statusId": statusId,
    "invoiceDateFrom": invoiceDateFrom?.toIso8601String(),
    "invoiceDateTo": invoiceDateTo,
  };
  factory InvoiceFilter.fromJson(Map<String, dynamic> json) => _$InvoiceFilterFromJson(json);
}
