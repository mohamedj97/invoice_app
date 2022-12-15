import 'package:json_annotation/json_annotation.dart';
part 'base_lookup.g.dart';
@JsonSerializable()
class BaseLookup{

  late int id;
  String? name;

  BaseLookup({required this.id, this.name});


  factory BaseLookup.fromJson(Map<String, dynamic> json) =>
      _$BaseLookupFromJson(json);
}