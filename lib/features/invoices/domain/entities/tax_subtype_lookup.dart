import 'package:json_annotation/json_annotation.dart';
part 'tax_subtype_lookup.g.dart';
@JsonSerializable()
class TaxSubtypeLookup {
  TaxSubtypeLookup({
    this.code,
    required this.id,
    this.name,
   required this.taxTypeId,

  });

  String? code;
  int id;
  String? name;
  int taxTypeId;

  factory TaxSubtypeLookup.fromJson(Map<String, dynamic> json) =>
      _$TaxSubtypeLookupFromJson(json);
}
