import 'invoice_delivery.dart';
import 'invoice_line.dart';
import 'invoice_payment.dart';
import 'line_tax.dart';

class SingleInvoiceResponse {
  SingleInvoiceResponse({
    this.id,
    this.invoiceNo,
    required this.invoiceDate,
    this.invoiceDirection,
    required this.invoiceType,
    this.companyId,
    this.branchId,
    required this.customerId,
    this.customerName,
    this.poNo,
    this.poDesc,
    this.soNo,
    this.soDesc,
    this.performaNo,
    this.totalSalesAmount,
    this.totalDiscountAmount,
    this.netAmount,
    this.extraDiscountAmount,
    this.totalItemDiscountAmount,
    this.totalTaxAmount,
    this.totalAmount,
    this.invoiceLinesCount,
    this.cancelled,
    this.cancelledDate,
    this.cancelledBy,
    this.approved,
    this.submitted,
    this.submittedDate,
    this.addedDate,
    this.updatedDate,
    this.addedBy,
    this.updatedBy,
    this.reference,
    this.dueDate,
    this.paymentTerms,
    this.paymentTermsComments,
    this.invoiceTypeId,
    this.invId,
    this.uuid,
    this.status,
    this.statusCode,
    this.details,
    this.invoiceDelivery,
    this.invoicePayment,
    required this.lines,
    required this.taxs,
  });

  int? id;
  String? invoiceNo;
  late DateTime invoiceDate;
  int? invoiceDirection;
  late int invoiceType;
  int? companyId;
  int? branchId;
  late int customerId;
  String? customerName;
  String? poNo;
  String? poDesc;
  String? soNo;
  String? soDesc;
  String? performaNo;
  num? totalSalesAmount;
  num? totalDiscountAmount;
  num? netAmount;
  num? extraDiscountAmount;
  num? totalItemDiscountAmount;
  num? totalTaxAmount;
  num? totalAmount;
  int? invoiceLinesCount;
  bool? cancelled;
  DateTime? cancelledDate;
  int? cancelledBy;
  bool? approved;
  bool? submitted;
  DateTime? submittedDate;
  DateTime? addedDate;
  DateTime? updatedDate;
  int? addedBy;
  int? updatedBy;
  String? reference;
  DateTime? dueDate;
  int? paymentTerms;
  String? paymentTermsComments;
  int? invoiceTypeId;
  int? invId;
  String? uuid;
  String? status;
  int? statusCode;
  String? details;
  InvoiceDelivery? invoiceDelivery;
  InvoicePayment? invoicePayment;
  late List<Line> lines = [];
  late List<LineTax> taxs = [];

  @override
  List<Object?> get props => [
    id,
    invoiceNo,
    invoiceDate,
    invoiceDirection,
    invoiceType,
    companyId,
    branchId,
    customerId,
    customerName,
    poNo,
    poDesc,
    soNo,
    soDesc,
    performaNo,
    totalSalesAmount,
    totalDiscountAmount,
    netAmount,
    extraDiscountAmount,
    totalItemDiscountAmount,
    totalTaxAmount,
    totalAmount,
    invoiceLinesCount,
    cancelled,
    cancelledDate,
    cancelledBy,
    approved,
    submitted,
    submittedDate,
    addedDate,
    updatedDate,
    addedBy,
    updatedBy,
    reference,
    dueDate,
    paymentTerms,
    paymentTermsComments,
    invoiceTypeId,
    invId,
    uuid,
    status,
    statusCode,
    details,
    invoiceDelivery,
    invoicePayment,
    lines,
    taxs,
      ];
}
