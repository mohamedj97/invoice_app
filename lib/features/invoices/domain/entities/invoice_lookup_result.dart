import 'package:invoice_app/features/invoices/domain/entities/item_lookup.dart';
import 'package:invoice_app/features/invoices/domain/entities/lookup_code.dart';
import 'package:invoice_app/features/invoices/domain/entities/tax_subtype_lookup.dart';
import 'package:invoice_app/features/products/domain/entities/meta.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../products/domain/entities/base_lookup.dart';

part 'invoice_lookup_result.g.dart';

@JsonSerializable()
class InvoiceLookUpResult {
  late List<BaseLookup> invoiceTypes = [];
  late List<BaseLookup> branches = [];
  late List<BaseLookup> paymentTerms = [];
  late List<BaseLookup> status = [];
  late List<TaxSubtypeLookup> taxSubTypes = [];
  late List<LookupCode> taxTypes = [];
  late List<LookupCode> currencies = [];
  late List<BaseLookup> countries = [];
  late List<BaseLookup> customers = [];
  late List<BaseLookup> unitTypes = [];
  late List<ItemLookup> items = [];
  late List<Meta> metaData = [];

  InvoiceLookUpResult({
    required this.invoiceTypes,
    required this.metaData,
    required this.branches,
    required this.paymentTerms,
    required this.taxTypes,
    required this.taxSubTypes,
    required this.customers,
    required this.currencies,
    required this.items,
    required this.countries,
    required this.unitTypes,
    required this.status,
  });

  factory InvoiceLookUpResult.fromJson(Map<String, dynamic> json) =>
      _$InvoiceLookUpResultFromJson(json);
}
