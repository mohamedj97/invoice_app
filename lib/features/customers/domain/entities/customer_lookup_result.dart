import 'package:json_annotation/json_annotation.dart';
import '../../../products/domain/entities/base_lookup.dart';

part 'customer_lookup_result.g.dart';

@JsonSerializable()
class CustomerLookUpResult {
  late List<BaseLookup> customerTypes = [];
  late List<BaseLookup> countries = [];
  late List<BaseLookup> governates = [];
  late List<BaseLookup> items = [];
  late List<BaseLookup> currencies = [];
  late List<BaseLookup> taxTypes = [];
  late List<BaseLookup> taxSubTypes = [];
  late List<BaseLookup> shipTypes = [];

  CustomerLookUpResult({
    required this.customerTypes,
    required this.countries,
    required this.governates,
    required this.items,
    required this.currencies,
    required this.taxTypes,
    required this.taxSubTypes,
    required this.shipTypes,
  });

  factory CustomerLookUpResult.fromJson(Map<String, dynamic> json) =>
      _$CustomerLookUpResultFromJson(json);
}
