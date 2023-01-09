import 'invoice_line.dart';

class SingleInvoiceResponse {
  SingleInvoiceResponse({
    required this.id,
    required this.invoiceType,
    this.extraDiscountAmount,
    this.addedDate,
    this.updatedDate,
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
  int invoiceType;
  DateTime? addedDate;
  DateTime? updatedDate;
  DateTime? dueDate;
  int? paymentTerms;
  String? paymentTermsComments;
  String? invoiceNo;
  DateTime invoiceDate;
  int invoiceTypeId;
  int customerId;
  num? extraDiscountAmount;
  List<Line> lines;

  @override
  List<Object?> get props => [
    id,
    invoiceNo,
    invoiceDate,
    invoiceType,
    extraDiscountAmount,
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
