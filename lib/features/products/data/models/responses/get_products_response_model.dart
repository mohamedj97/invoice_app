import 'package:invoice_app/features/products/domain/entities/meta.dart';
import 'package:invoice_app/features/products/domain/entities/product.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../domain/entities/list_meta_data.dart';
import '../../../domain/entities/product_result_response.dart';

part 'get_products_response_model.g.dart';

@JsonSerializable()
class GetProductsResponseDataModel extends ProductsResultResponse {
  GetProductsResponseDataModel({
    required super.items,
    super.meta,
    required super.listMetadata,
  });

  factory GetProductsResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetProductsResponseDataModelFromJson(json);
}

@JsonSerializable()
class GetProductsResponse extends BaseAPIResponse {
  late GetProductsResponseDataModel? result;

  GetProductsResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory GetProductsResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetProductsResponseFromJson(json!);
}
