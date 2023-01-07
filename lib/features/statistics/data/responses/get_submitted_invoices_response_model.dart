import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../domain/entities/invoices_totals.dart';
import '../../domain/entities/submitted_invoices_totals.dart';

part 'get_submitted_invoices_response_model.g.dart';

@JsonSerializable()
class GetSubmittedInvoiceResponseDataModel extends SubmittedInvoicesTotals {
  GetSubmittedInvoiceResponseDataModel({
  required super.invoicesTotal_Daily,
  required super.creditTotal_Daily,
  required super.total_Daily,
  required super.invoicesTotal_Monthly,
  required super.creditTotal_Monthly,
  required super.total_Monthly,
  required super.invoicesTotal_Yearly,
  required super.creditTotal_Yearly,
  required super.total_Yearly,
  });

  factory GetSubmittedInvoiceResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetSubmittedInvoiceResponseDataModelFromJson(json);
}

@JsonSerializable()
class GetSubmittedInvoiceResponse extends BaseAPIResponse {
  late GetSubmittedInvoiceResponseDataModel? result;

  GetSubmittedInvoiceResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory GetSubmittedInvoiceResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetSubmittedInvoiceResponseFromJson(json!);
}
