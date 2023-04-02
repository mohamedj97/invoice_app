import 'package:invoice_app/features/customers/domain/entities/customer_filter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer_filter_request.g.dart';
@JsonSerializable()
class CustomerFilterRequest {

  CustomerFilter? filter;
  int pageNo;
  int pageSize;
  String? sortBy;
  String? sortDir;

  CustomerFilterRequest({
    this.filter,
    required this.pageNo,
    required this.pageSize,
    this.sortBy,
    this.sortDir,
  });

  @override
  String toString() {
    return 'CustomerFilterRequest[filter=$filter,  pageNo=$pageNo,  pageSize=$pageSize,  sortDir=$sortDir,  sortBy=$sortBy,  ]';
  }

  factory CustomerFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$CustomerFilterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerFilterRequestToJson(this);
}
