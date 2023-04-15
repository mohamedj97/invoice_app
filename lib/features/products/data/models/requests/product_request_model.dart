import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/product_request.dart';

part 'product_request_model.g.dart';

@JsonSerializable()
class ProductModel extends ProductRequest {
  ProductModel({
    super.id,
    super.companyId,
    super.code,
    super.brickcode,
    required super.name,
    super.type,
    super.description,
    super.unittype,
    required super.active,
    super.price,
    super.image,
  }
  );

  @override
  String toString() {
    return 'ProductModel[id=$id,  companyId=$companyId,  code=$code,  brickcode=$brickcode,  name=$name,  type=$type,  description=$description,   unittype=$unittype,   active=$active,   price==$price,   image==$image,  ]';
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
