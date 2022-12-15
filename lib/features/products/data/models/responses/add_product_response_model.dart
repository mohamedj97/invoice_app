import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../domain/entities/product.dart';

part 'add_product_response_model.g.dart';

@JsonSerializable()
class AddProductResponseDataModel extends Product {
  AddProductResponseDataModel({
    required super.companyId,
    required super.id,
    required super.name,
    required super.code,
    required super.brickcode,
    required super.type,
    required super.description,
    required super.unittype,
    required super.active,
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
