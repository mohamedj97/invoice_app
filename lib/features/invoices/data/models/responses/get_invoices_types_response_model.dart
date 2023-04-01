import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../../products/domain/entities/meta.dart';
import '../../../domain/entities/get_invoices_types_result_response.dart';
import '../../../domain/entities/invoice_lookup_result.dart';

part 'get_invoices_types_response_model.g.dart';

@JsonSerializable()
class GetInvoiceTypesResponseDataModel extends InvoiceTypesResultResponse {
  GetInvoiceTypesResponseDataModel({
    required super.result,
  });

  factory GetInvoiceTypesResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetInvoiceTypesResponseDataModelFromJson(json);
}

@JsonSerializable()
class GetInvoiceTypesResponse extends BaseAPIResponse {
  late GetInvoiceTypesResponseDataModel? result;

  GetInvoiceTypesResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory GetInvoiceTypesResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetInvoiceTypesResponseFromJson(json!);
}
