import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/invoice_line.dart';
import '../../../domain/entities/invoice_model.dart';

part 'invoice_request_model.g.dart';

@JsonSerializable()
class InvoiceRequestModel extends InvoiceModel {
  InvoiceRequestModel({
    required super.id,
    required super.invoiceType,
    required super.addedDate,
    required super.updatedDate,
    super.dueDate,
    super.paymentTerms,
    super.paymentTermsComments,
    super.invoiceNo,
    required super.invoiceDate,
    required super.invoiceTypeId,
    required super.customerId,
    required super.lines,
  });

  @override
  String toString() {
    return 'CustomerModel[id=$id,  invoiceType=$invoiceType,  addedDate=$addedDate,  updatedDate=$updatedDate,  dueDate=$dueDate,  paymentTerms=$paymentTerms,  paymentTermsComments=$paymentTermsComments,  invoiceNo=$invoiceNo,  invoiceDate=$invoiceDate,  invoiceTypeId=$invoiceTypeId,  customerId=$customerId,  lines=$lines,  ]';
  }

  factory InvoiceRequestModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceRequestModelToJson(this);
}
