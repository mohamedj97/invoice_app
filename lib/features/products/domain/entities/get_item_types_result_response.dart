import 'package:invoice_app/features/products/domain/entities/base_lookup.dart';
import 'meta.dart';

class ItemTypesResultResponse {
  late List<BaseLookup> itemTypes = [];
  late List<BaseLookup> unitTypes = [];
  int? total;
  late List<Meta> meta = [];

  ItemTypesResultResponse({
    required this.itemTypes,
    required this.unitTypes,
    this.total,
    required this.meta,
  });

  @override
  List<Object?> get props => [
        itemTypes,
        unitTypes,
        total,
        meta,
      ];
}
