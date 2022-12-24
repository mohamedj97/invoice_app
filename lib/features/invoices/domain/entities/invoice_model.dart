import 'package:equatable/equatable.dart';

import 'invoice_line.dart';

class InvoiceModel extends Equatable {
  InvoiceModel({
    required this.id,
    required this.invoiceType,
    required this.addedDate,
    required this.updatedDate,
    this.dueDate,
    this.paymentTerms,
    this.paymentTermsComments,
    this.invoiceNo,
    required this.invoiceDate,
    required this.invoiceTypeId,
    required this.customerId,
    required this.lines,
  });

  int id;
  String invoiceType;
  DateTime addedDate;
  DateTime updatedDate;
  DateTime? dueDate;
  int? paymentTerms;
  String? paymentTermsComments;
  String? invoiceNo;
  DateTime invoiceDate;
  int invoiceTypeId;
  int customerId;
  List<Line> lines;

  @override
  List<Object?> get props => [
        id,
        invoiceNo,
        invoiceDate,
        invoiceType,
        customerId,
        addedDate,
        updatedDate,
        dueDate,
        paymentTerms,
        paymentTermsComments,
        invoiceTypeId,
        lines,
      ];
}
