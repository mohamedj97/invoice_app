import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/customer_filter.dart';
import '../../../domain/entities/customer_filter_request.dart';


part 'get_customers_request_model.g.dart';

@JsonSerializable()
class CustomerFilterGenericFilterModel extends CustomerFilterRequest {
  CustomerFilterGenericFilterModel({
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

  factory CustomerFilterGenericFilterModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerFilterGenericFilterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerFilterGenericFilterModelToJson(this);
}
