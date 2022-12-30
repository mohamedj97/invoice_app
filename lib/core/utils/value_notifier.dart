import 'package:flutter/material.dart';
import '../../features/invoices/domain/entities/tax_subtype_lookup.dart';

class SubTypeSection {
  ValueNotifier<List<TaxSubtypeLookup>> subTaxValueNotifier =
      ValueNotifier<List<TaxSubtypeLookup>>([]);

  SubTypeSection({required this.subTaxValueNotifier});
}

class SubTypeValueNotifier extends ValueNotifier<SubTypeSection> {
  SubTypeValueNotifier({required SubTypeSection value}) : super(value);

  void updateSubTaxTypes(
      List<TaxSubtypeLookup> taxSubTypes,int id) {
    value.subTaxValueNotifier.value.clear();
    value.subTaxValueNotifier.value = taxSubTypes.where((o) => o.taxTypeId == id).toList();
    notifyListeners();
  }
}
