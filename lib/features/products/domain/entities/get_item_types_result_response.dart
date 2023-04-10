import 'package:invoice_app/features/products/domain/entities/base_lookup.dart';
import 'meta.dart';

class ItemTypesResultResponse {
  late List<BaseLookup> itemTypes = [];
  late List<BaseLookup> unitTypes = [];
  late List<Meta> metaData = [];

  ItemTypesResultResponse({
    required this.itemTypes,
    required this.unitTypes,
    required this.metaData,
  });

  @override
  List<Object> get props => [
        itemTypes,
        unitTypes,
        metaData,
      ];
}
