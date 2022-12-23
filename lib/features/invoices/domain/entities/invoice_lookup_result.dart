import 'package:json_annotation/json_annotation.dart';

import '../../../products/domain/entities/base_lookup.dart';

part 'invoice_lookup_result.g.dart';

@JsonSerializable()
class InvoiceLookUpResult {
  late List<BaseLookup> invoiceTypes = [];
  late List<BaseLookup> branches = [];
  late List<BaseLookup> paymentTerms = [];
  late List<BaseLookup> taxSubTypes = [];
  late List<BaseLookup> taxTypes = [];
  late List<BaseLookup> currencies = [];
  late List<BaseLookup> customers = [];
  late List<BaseLookup> unitTypes = [];
  late List<BaseLookup> items = [];

  InvoiceLookUpResult({
    required this.invoiceTypes,
    required this.branches,
    required this.paymentTerms,
    required this.taxTypes,
    required this.taxSubTypes,
    required this.customers,
    required this.currencies,  
    required this.items,
    required this.unitTypes,
  });

  factory InvoiceLookUpResult.fromJson(Map<String, dynamic> json) =>
      _$InvoiceLookUpResultFromJson(json);
}
