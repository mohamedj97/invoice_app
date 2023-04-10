import 'package:json_annotation/json_annotation.dart';

import 'item_filter.dart';
part 'product_filter_request.g.dart';

@JsonSerializable()
class ProductFilterRequest {

  ItemFilter? filter;
  int pageNo;
  int pageSize;
  String? sortBy;
  String? sortDir;

  ProductFilterRequest({
    this.filter,
    required this.pageNo,
    required this.pageSize,
     this.sortBy,
     this.sortDir,
  });
  @override
  String toString() {
    return 'ProductFilterRequest[filter=$filter,  pageNo=$pageNo,  pageSize=$pageSize,  sortDir=$sortDir,  sortBy=$sortBy,  ]';
  }

  factory ProductFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductFilterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProductFilterRequestToJson(this);
}
