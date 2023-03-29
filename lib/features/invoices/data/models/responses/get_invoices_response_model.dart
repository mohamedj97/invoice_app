import 'package:invoice_app/features/invoices/domain/entities/invoice_head_model.dart';
import 'package:invoice_app/features/invoices/domain/entities/meta_data.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../domain/entities/invoice_result_response.dart';

part 'get_invoices_response_model.g.dart';

@JsonSerializable()
class GetInvoicesResponseDataModel extends InvoiceResultResponse {
  GetInvoicesResponseDataModel({
    required super.result,
    required super.metaData,
    required super.listMetadata,
  });

  factory GetInvoicesResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetInvoicesResponseDataModelFromJson(json);
}

@JsonSerializable()
class GetInvoicesResponse extends BaseAPIResponse {
  late GetInvoicesResponseDataModel? result;

  GetInvoicesResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory GetInvoicesResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetInvoicesResponseFromJson(json!);
}
