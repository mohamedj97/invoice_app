import 'package:equatable/equatable.dart';

import 'item_filter.dart';

class ProductFilterRequest extends Equatable {

  ItemFilter filter;
  int pageNo;
  int pageSize;
  String? sortBy;
  String? sortDir;

  ProductFilterRequest({
    required this.filter,
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
