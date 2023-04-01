import 'package:json_annotation/json_annotation.dart';

import 'invoice_filter.dart';
part 'invoice_filter_request.g.dart';
@JsonSerializable()
class InvoiceFilterRequest {

  InvoiceFilter? filter;
  int pageNo;
  int pageSize;
  String? sortBy;
  String? sortDir;

  InvoiceFilterRequest({
    this.filter,
    required this.pageNo,
    required this.pageSize,
    this.sortBy,
    this.sortDir,
  });

  @override
  String toString() {
    return 'InvoiceFilterRequest[filter=$filter,  pageNo=$pageNo,  pageSize=$pageSize,  sortDir=$sortDir,  sortBy=$sortBy,  ]';
  }

  factory InvoiceFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFilterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceFilterRequestToJson(this);
}
