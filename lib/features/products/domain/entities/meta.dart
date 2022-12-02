import 'package:json_annotation/json_annotation.dart';
part 'meta.g.dart';
@JsonSerializable()
class Meta{

  String? field;
  String? label;

  Meta({this.field, this.label});


  factory Meta.fromJson(Map<String, dynamic> json) =>
      _$MetaFromJson(json);
}