import 'package:json_annotation/json_annotation.dart';

import '../../../products/domain/entities/base_lookup.dart';
import '../../../products/domain/entities/meta.dart';
import 'governate_lookup.dart';

part 'company_lookup_result.g.dart';

@JsonSerializable()
class CompanyLookUpResult {
  late List<BaseLookup> businessActivity = [];
  late List<BaseLookup> countries = [];
  late List<BaseLookup> etaEnvironment = [];
  late List<BaseLookup> invoiceVersion = [];
  late List<Meta> metaData = [];
  late List<GovernateLookup> governates = [];

  CompanyLookUpResult({
    required this.businessActivity,
    required this.countries,
    required this.etaEnvironment,
    required this.invoiceVersion,
    required this.metaData,
    required this.governates,
  });

  factory CompanyLookUpResult.fromJson(Map<String, dynamic> json) =>
      _$CompanyLookUpResultFromJson(json);
}
