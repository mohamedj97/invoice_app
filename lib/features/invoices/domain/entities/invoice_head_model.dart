import 'package:json_annotation/json_annotation.dart';
part 'invoice_head_model.g.dart';
@JsonSerializable()
class InvoiceHeadModel {
  InvoiceHeadModel({
    required this.id,
    required this.invoiceDate,
    this.direction,
    this.status,
    this.invoiceNo,
    this.invoiceType,
    this.customerCode,
    this.customerName,
    this.customerTaxRegId,
    this.customerCountry,
    this.totalSalesAmount,
    this.totalDiscountAmount,
    this.netAmount,
    this.totalTaxAmount,
    this.totalAmount,
    this.invoiceLinesCount,

  });

  int id;
  DateTime invoiceDate;
  String? direction;
  String? status;
  String? invoiceNo;
  String? invoiceType;
  String? customerCode;
  String? customerName;
  String? customerTaxRegId;
  String? customerCountry;
  num? totalSalesAmount;
  num? totalDiscountAmount;
  num? netAmount;
  num? totalTaxAmount;
  num? totalAmount;
  int? invoiceLinesCount;

  factory InvoiceHeadModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceHeadModelFromJson(json);
}
