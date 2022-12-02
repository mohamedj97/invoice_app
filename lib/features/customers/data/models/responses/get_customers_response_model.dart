import 'package:invoice_app/features/customers/domain/entities/customer_entity.dart';
import 'package:invoice_app/features/customers/domain/entities/customer_result_response.dart';
import 'package:invoice_app/features/customers/domain/entities/meta_data_model.dart';
import '../../../../../core/api/base_api_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_customers_response_model.g.dart';

@JsonSerializable()
class GetCustomersResponseDataModel extends CustomerResultResponse {
  GetCustomersResponseDataModel({
    required super.result,
    super.total,
    required super.metaData,
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