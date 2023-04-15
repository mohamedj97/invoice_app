import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/item_filter.dart';
import '../../../domain/entities/product_filter_request.dart';


part 'get_products_request_model.g.dart';

@JsonSerializable()
class ProductFilterGenericFilterModel extends ProductFilterRequest {
  ProductFilterGenericFilterModel({
    super.sortBy,
    super.sortDir,
    super.filter,
    required super.pageNo,
    required super.pageSize,
  }
      );

  factory ProductFilterGenericFilterModel.fromJson(Map<String, dynamic> json) =>
      _$ProductFilterGenericFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductFilterGenericFilterModelToJson(this);
}
