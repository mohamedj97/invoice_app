import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/item_filter.dart';
import '../../../domain/entities/product_filter_request.dart';


part 'get_products_request_model.g.dart';

@JsonSerializable()
class InvoiceFilterGenericFilterModel extends ProductFilterRequest {
  InvoiceFilterGenericFilterModel({
    super.sortBy,
    super.sortDir,
    super.filter,
    required super.pageNo,
    required super.pageSize,
  }
      );

  @override
  String toString() {
    return 'InvoiceFilterGenericFilterModel[sortBy=$sortBy,  sortDir=$sortDir,  filter=$filter,  pageNo=$pageNo,  ]';
  }

  factory InvoiceFilterGenericFilterModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFilterGenericFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceFilterGenericFilterModelToJson(this);
}
