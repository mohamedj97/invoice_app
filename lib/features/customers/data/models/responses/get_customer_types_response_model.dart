import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../../company_registration/domain/entities/governate_lookup.dart';
import '../../../../invoices/domain/entities/item_lookup.dart';
import '../../../../invoices/domain/entities/lookup_code.dart';
import '../../../../invoices/domain/entities/tax_subtype_lookup.dart';
import '../../../../products/domain/entities/base_lookup.dart';
import '../../../../products/domain/entities/meta.dart';
import '../../../domain/entities/get_customer_types_result_response.dart';

part 'get_customer_types_response_model.g.dart';

@JsonSerializable()
class GetCustomerTypesResponseDataModel extends CustomerTypesResultResponse {
  GetCustomerTypesResponseDataModel({
    required super.metaData,
    required super.customerType,
    required super.countries,
    required super.currencies,
    required super.taxTypes,
    required super.shipTypes,
    required super.governates,
    required super.items,
    required super.taxSubTypes,
  });

  factory GetCustomerTypesResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetCustomerTypesResponseDataModelFromJson(json);
}

@JsonSerializable()
class GetCustomerTypesResponse extends BaseAPIResponse {
  late GetCustomerTypesResponseDataModel? result;

  GetCustomerTypesResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory GetCustomerTypesResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetCustomerTypesResponseFromJson(json!);
}
