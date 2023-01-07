import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../domain/entities/invoice_line.dart';
import '../../../domain/entities/single_invoice_response.dart';

part 'get_single_invoice_response_model.g.dart';

@JsonSerializable()
class GetSingleInvoiceResponseDataModel extends SingleInvoiceResponse {
  GetSingleInvoiceResponseDataModel({
    required super.id,
    required super.invoiceType,
    super.extraDiscountAmount,
    super.addedDate,
    super.updatedDate,
    super.dueDate,
    super.paymentTerms,
    super.paymentTermsComments,
    super.invoiceNo,
    required super.invoiceDate,
    required super.invoiceTypeId,
    required super.customerId,
    required super.lines,
  });

  factory GetSingleInvoiceResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetSingleInvoiceResponseDataModelFromJson(json);
}

@JsonSerializable()
class GetSingleInvoiceResponse extends BaseAPIResponse {
  late GetSingleInvoiceResponseDataModel? result;

  GetSingleInvoiceResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory GetSingleInvoiceResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetSingleInvoiceResponseFromJson(json!);
}
