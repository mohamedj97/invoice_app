import '../../../products/domain/entities/meta.dart';
import 'customer_lookup_result.dart';

class CustomerTypesResultResponse {
  CustomerLookUpResult result;
  int? total;
  late List<Meta> metaData = [];

  CustomerTypesResultResponse({
    required this.result,
    this.total,
    required this.metaData,
  });

  @override
  List<Object?> get props => [
    result,
    total,
    metaData,
  ];
}
