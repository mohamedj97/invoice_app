import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../domain/entities/product.dart';

part 'add_product_response_model.g.dart';

@JsonSerializable()
class AddProductResponseDataModel extends Product {
  AddProductResponseDataModel({
    required super.id,
    super.companyId,
    super.code,
    super.brickcode,
    required super.name,
    super.type,
    super.description,
    super.unittypeid,
    super.unittypecode,
    super.unittypename,
    super.unittypenamear,
    super.price,
    super.image,
    super.active,
  });

  factory AddProductResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$AddProductResponseDataModelFromJson(json);
}


@JsonSerializable()
class AddProductResponse extends BaseAPIResponse {
  late AddProductResponseDataModel? result;

  AddProductResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory AddProductResponse.fromJson(Map<String, dynamic>? json) =>
      _$AddProductResponseFromJson(json!);
}
