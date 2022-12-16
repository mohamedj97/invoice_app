import 'package:invoice_app/features/products/domain/entities/item_lookup_result.dart';
import 'meta.dart';

class ItemTypesResultResponse {
  ItemLookUpResult result;
  int? total;
  late List<Meta> meta = [];

  ItemTypesResultResponse({
    required this.result,
    this.total,
    required this.meta,
  });

  @override
  List<Object?> get props => [
        result,
        total,
        meta,
      ];
}
