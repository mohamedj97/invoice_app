import 'package:json_annotation/json_annotation.dart';
part 'item_lookup.g.dart';
@JsonSerializable()
class ItemLookup {
  ItemLookup({
    this.code,
    this.brickCode,
    this.description,
    this.unittypeID,
    this.price,
   required this.id,
    this.name,

  });
  String? code;
  String? brickCode;
  String? description;
  int? unittypeID;
  num? price;
  int id;
  String? name;

  factory ItemLookup.fromJson(Map<String, dynamic> json) =>
      _$ItemLookupFromJson(json);
}
