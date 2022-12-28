import 'package:equatable/equatable.dart';

class InvoiceFilter extends Equatable {
  InvoiceFilter({
    this.freeText,
    this.invoiceNo,
    this.invoiceDate,
    this.invoiceTypeId,
    this.invoiceTypeName,
    this.customerId,
    this.customerName,
    this.invoiceDirection,
    this.status,
  });

  String? freeText;
  String? invoiceNo;
  DateTime? invoiceDate;
  int? invoiceTypeId;
  String? invoiceTypeName;
  int? customerId;
  String? customerName;
  int? invoiceDirection;
  String? status;

  @override
  List<Object?> get props => [
    freeText,
    invoiceNo,
    invoiceDate,
    invoiceTypeId,
    invoiceTypeName,
    customerId,
    customerName,
    invoiceDirection,
    status,
  ];
}
