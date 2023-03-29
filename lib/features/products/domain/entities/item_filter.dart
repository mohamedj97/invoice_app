import 'package:json_annotation/json_annotation.dart';

part 'item_filter.g.dart';

@JsonSerializable()
class ItemFilter {
  String? freeText;
  String? code;
  String? brickcode;
  String? name;
  String? itemType;
  String? description;
  int? unitType;
  bool? active;

  ItemFilter({
    this.freeText,
    this.code,
    this.name,
    this.brickcode,
    this.itemType,
    this.description,
    this.unitType,
    this.active,
  });

  factory ItemFilter.fromJson(Map<String, dynamic> json) => _$ItemFilterFromJson(json);
}
