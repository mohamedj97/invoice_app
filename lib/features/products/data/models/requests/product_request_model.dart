import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/product_request.dart';

part 'product_request_model.g.dart';

@JsonSerializable()
class ProductModel extends ProductRequest {
  ProductModel(
      super.code,
      super.brickcode,
      super.name,
      super.type,
      super.description,
      super.unittype,
      super.price,
      super.active,
  );

  @override
  String toString() {
    return 'ProductModel[code=$code,  brickcode=$brickcode,  name=$name,  type=$type,  description=$description,   unittype=$unittype,   price=$price,   active=$active, ]';
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
