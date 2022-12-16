import 'package:json_annotation/json_annotation.dart';
import 'base_lookup.dart';

part 'item_lookup_result.g.dart';
@JsonSerializable()
class ItemLookUpResult{

  late List<BaseLookup> itemTypes = [];
  late List<BaseLookup> unitTypes = [];

  ItemLookUpResult({required this.itemTypes,required this.unitTypes});


  factory ItemLookUpResult.fromJson(Map<String, dynamic> json) =>
      _$ItemLookUpResultFromJson(json);
}