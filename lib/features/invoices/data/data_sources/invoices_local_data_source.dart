import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/item_lookup.dart';
import '../../domain/entities/line_tax.dart';

abstract class InvoicesLocalDataSource {
  void updateItems(List<ItemLookup> items);
  List<ItemLookup> getItems();
  void updateTaxes(List<LineTax> taxes);
  List<LineTax> getTaxes();
  void clearItems(List<ItemLookup> items);
  void clearTaxes(List<LineTax> taxes);
}

class InvoicesLocalDataSourceImpl extends InvoicesLocalDataSource {
  final SharedPreferences sharedPreferences;
  InvoicesLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  @override
  void clearItems(List<ItemLookup> items) {
    items.clear();
  }

  @override
  void clearTaxes(List<LineTax> taxes) {
    taxes.clear();
  }

  @override
  List<ItemLookup> getItems() {
    // TODO: implement getItems
    throw UnimplementedError();
  }

  @override
  List<LineTax> getTaxes() {
    // TODO: implement getTaxes
    throw UnimplementedError();
  }

  @override
  void updateItems(List<ItemLookup> items) {
    // TODO: implement updateItems
    throw UnimplementedError();
  }

  @override
  void updateTaxes(List<LineTax> taxes) {
    // TODO: implement updateTaxes
    throw UnimplementedError();
  }

}
