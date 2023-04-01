import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../../products/domain/entities/base_lookup.dart';
import '../../../../products/domain/entities/meta.dart';
import '../../../domain/entities/get_invoices_types_result_response.dart';
import '../../../domain/entities/invoice_lookup_result.dart';
import '../../../domain/entities/item_lookup.dart';
import '../../../domain/entities/lookup_code.dart';
import '../../../domain/entities/tax_subtype_lookup.dart';

part 'get_invoices_types_response_model.g.dart';

@JsonSerializable()
class GetInvoiceTypesResponseDataModel extends InvoiceLookUpResult {
  GetInvoiceTypesResponseDataModel({
    required super.invoiceType,
    required super.metaData,
    required super.branches,
    required super.paymentTerms,
    required super.taxTypes,
    required super.taxSubTypes,
    required super.customers,
    required super.currencies,
    required super.items,
    required super.countries,
    required super.unitTypes,
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
