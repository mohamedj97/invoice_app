import '../../../products/domain/entities/base_lookup.dart';
import '../../domain/entities/invoice_line.dart';
import '../../domain/entities/item_lookup.dart';
import '../../domain/entities/line_tax.dart';
import '../../domain/entities/lookup_code.dart';
import '../../domain/entities/tax_subtype_lookup.dart';

class InvoicesLocalDataSource {
  static List<LineTax> addedTaxes = [];
  static List<Line> addedItems = [];
  static List<ItemLookup> items = [];
  static List<TaxSubtypeLookup> taxSubTypes = [];
  static List<LookupCode> taxTypes = [];
  static num? taxRate;
  static List<String> selectedItemsNames = [];
  static LookupCode? mainTaxType;
  static TaxSubtypeLookup? subTaxType;
  static BaseLookup? invoiceType;

  static int? status;
  static String? customerName;
  static int? customerId;
  static DateTime? invoiceDate;

  static void clearData() {
    addedTaxes = [];
    addedItems = [];
    items = [];
    taxSubTypes = [];
    taxTypes = [];
    taxRate = null;
    selectedItemsNames = [];
    mainTaxType = null;
    subTaxType = null;
    invoiceType = null;
    status = null;
    customerName = null;
    customerId = null;
    invoiceDate = null;
  }
// void clearItems() {
//   addedItems.clear();
// }
//
//
// void clearTaxes() {
//   addedTaxes.clear();
// }
//
//
// List<ItemLookup> getItems() {
//   return addedItems;
// }
//
//
// List<LineTax> getTaxes() {
//   return addedTaxes;
// }
//
//
// void updateItems({required List<ItemLookup> filteredItems}) {
//   clearItems();
//   addedItems=filteredItems;
// }
//
//
// void updateTaxes({required List<LineTax> filteredTaxes}) {
//   clearTaxes();
//   addedTaxes=filteredTaxes;
// }

}
