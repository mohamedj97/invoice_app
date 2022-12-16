import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../../products/domain/entities/meta.dart';
import '../../../domain/entities/customer_lookup_result.dart';
import '../../../domain/entities/get_customer_types_result_response.dart';

part 'get_customer_types_response_model.g.dart';

@JsonSerializable()
class GetCustomerTypesResponseDataModel extends CustomerTypesResultResponse {
  GetCustomerTypesResponseDataModel({
    required super.result,
    required super.metaData,
    super.total,
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
