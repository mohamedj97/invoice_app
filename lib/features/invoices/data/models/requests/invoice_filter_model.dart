import 'package:invoice_app/features/invoices/domain/entities/invoice_filter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invoice_filter_model.g.dart';

@JsonSerializable()
class InvoiceFilterModel extends InvoiceFilter {
  InvoiceFilterModel({
    super.freeText,
    super.invoiceDate,
    super.invoiceTypeId,
    super.invoiceTypeName,
    super.invoiceDirection,
    super.customerName,
    super.customerId,
    super.status,
    super.invoiceNo,
  });

  @override
  String toString() {
    return 'InvoiceFilter[freeText=$freeText,  invoiceNo=$invoiceNo,  invoiceDate=$invoiceDate,  invoiceTypeId=$invoiceTypeId,  invoiceTypeName=$invoiceTypeName,  customerId=$customerId,  customerName=$customerName,  invoiceDirection=$invoiceDirection,  status=$status,  }]';
  }

  factory InvoiceFilterModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceFilterModelToJson(this);
}
