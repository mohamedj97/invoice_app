import 'package:json_annotation/json_annotation.dart';

part 'governate_lookup.g.dart';

@JsonSerializable()
class GovernateLookup {
  GovernateLookup({
    this.countryId,
    required this.id,
    this.name,
  });

  String? countryId;
  int id;
  String? name;

  factory GovernateLookup.fromJson(Map<String, dynamic> json) => _$GovernateLookupFromJson(json);
}
