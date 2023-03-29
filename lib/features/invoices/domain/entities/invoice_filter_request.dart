import 'package:equatable/equatable.dart';

import 'invoice_filter.dart';


class InvoiceFilterRequest extends Equatable {

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
  List<Object?> get props => [
    filter,
    pageNo,
    pageSize,
    sortBy,
    sortDir,
  ];
}
