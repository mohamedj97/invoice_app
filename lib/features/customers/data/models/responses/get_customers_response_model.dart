import 'package:invoice_app/features/customers/domain/entities/customer_result_response.dart';
import 'package:invoice_app/features/customers/domain/entities/meta_data_model.dart';
import '../../../../../core/api/base_api_response.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../products/domain/entities/list_meta_data.dart';
import '../../../domain/entities/customers_model.dart';

part 'get_customers_response_model.g.dart';

@JsonSerializable()
class GetCustomersResponseDataModel extends CustomerResultResponse {
  GetCustomersResponseDataModel({
    required super.customers,
    required super.metaData,
    required super.listMetadata,
  });

  factory GetCustomersResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetCustomersResponseDataModelFromJson(json);
}

@JsonSerializable()
class GetCustomersResponse extends BaseAPIResponse {
   late GetCustomersResponseDataModel? result;

   GetCustomersResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory GetCustomersResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetCustomersResponseFromJson(json!);
}