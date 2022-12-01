// import 'package:equatable/equatable.dart';
//
// import 'invoice_line.dart';
//
// class InvoiceModel extends Equatable {
//   InvoiceModel({
//     required this.id,
//     this.invoiceNo,
//     required this.invoiceDate,
//     required this.invoiceDirection,
//     required this.invoiceType,
//     required this.companyId,
//     required this.branchId,
//     required this.customerId,
//     this.poNo,
//     this.poDesc,
//     this.soNo,
//     this.soDesc,
//     this.performaNo,
//     required this.totalSalesAmount,
//     required this.totalDiscountAmount,
//     required this.netAmount,
//     required this.extraDiscountAmount,
//     required this.totalItemDiscountAmount,
//     required this.totalAmount,
//     required this.invoiceLinesCount,
//     required this.cancelled,
//     required this.cancelledDate,
//     this.cancelledBy,
//     this.approved,
//     this.submitted,
//     this.submittedDate,
//     required this.addedDate,
//     required this.updatedDate,
//     this.addedBy,
//     this.updatedBy,
//     this.reference,
//     this.dueDate,
//     this.paymentTerms,
//     this.paymentTermsComments,
//     required this.invoiceTypeId,
//     this.invId,
//     this.uuid,
//     this.status,
//     this.statusCode,
//     this.details,
//     this.invoiceDelivery,
//     this.invoicePayment,
//     required this.lines,
//   });
//
//   late int id;
//   String? invoiceNo;
//   late DateTime invoiceDate;
//   late int invoiceDirection;
//   late String invoiceType;
//   late int companyId;
//   late int branchId;
//   late int customerId;
//   String? poNo;
//   String? poDesc;
//   String? soNo;
//   String? soDesc;
//   String? performaNo;
//   num totalSalesAmount;
//   num totalDiscountAmount;
//   num netAmount;
//   num extraDiscountAmount;
//   num totalItemDiscountAmount;
//   num totalAmount;
//   int invoiceLinesCount;
//   bool cancelled;
//   bool cancelledDate;
//   String? cancelledBy;
//   bool? approved;
//   bool? submitted;
//   DateTime? submittedDate;
//   DateTime addedDate;
//   DateTime updatedDate;
//   String? addedBy;
//   String? updatedBy;
//   String? reference;
//   DateTime? dueDate;
//   String? paymentTerms;
//   String? paymentTermsComments;
//   int invoiceTypeId;
//   int? invId;
//   String? uuid;
//   String? status;
//   int? statusCode;
//   String? details;
//   String? invoiceDelivery;
//   String? invoicePayment;
//   late List<InvoiceLine> lines = [];
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [
//         id,
//         invoiceNo,
//         invoiceDate,
//         invoiceDirection,
//         invoiceType,
//         companyId,
//         branchId,
//         customerId,
//         poNo,
//         poDesc,
//         soNo,
//         soDesc,
//         performaNo,
//         totalSalesAmount,
//         totalDiscountAmount,
//         netAmount,
//         extraDiscountAmount,
//         totalItemDiscountAmount,
//         totalAmount,
//         invoiceLinesCount,
//         cancelled,
//         cancelledDate,
//         cancelledBy,
//         approved,
//         submitted,
//         submittedDate,
//         addedDate,
//         updatedDate,
//         addedBy,
//         updatedBy,
//         reference,
//         dueDate,
//         paymentTerms,
//         paymentTermsComments,
//         invoiceTypeId,
//         invId,
//         uuid,
//         status,
//         statusCode,
//         details,
//         invoiceDelivery,
//         invoicePayment,
//         lines,
//       ];
// }
