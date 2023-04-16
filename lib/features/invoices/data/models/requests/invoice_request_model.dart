import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/invoice_delivery.dart';
import '../../../domain/entities/invoice_line.dart';
import '../../../domain/entities/invoice_model.dart';
import '../../../domain/entities/invoice_payment.dart';
import '../../../domain/entities/invoice_tax.dart';

part 'invoice_request_model.g.dart';

@JsonSerializable()
class InvoiceRequestModel extends InvoiceModel {
  InvoiceRequestModel({
    super.id,
    super.invoiceNo,
    required super.invoiceDate,
    super.invoiceDirection,
    required super.invoiceType,
    super.companyId,
    super.branchId,
    required super.customerId,
    super.customerName,
    super.poNo,
    super.poDesc,
    super.soNo,
    super.soDesc,
    super.performaNo,
    super.totalSalesAmount,
    super.totalDiscountAmount,
    super.netAmount,
    super.extraDiscountAmount,
    super.totalItemDiscountAmount,
    super.totalTaxAmount,
    super.totalAmount,
    super.invoiceLinesCount,
    super.cancelled,
    super.cancelledDate,
    super.cancelledBy,
    super.approved,
    super.submitted,
    super.submittedDate,
    super.addedDate,
    super.updatedDate,
    super.addedBy,
    super.updatedBy,
    super.reference,
    super.dueDate,
    super.paymentTerms,
    super.paymentTermsComments,
    super.invoiceTypeId,
    super.invId,
    super.uuid,
    super.status,
    super.statusCode,
    super.details,
    super.invoiceDelivery,
    super.invoicePayment,
    super.lines,
    super.taxs,
  });


  factory InvoiceRequestModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceRequestModelToJson(this);
}
