import 'package:json_annotation/json_annotation.dart';
part 'meta_data.g.dart';
@JsonSerializable()
class MetaData{

  String? field;
  String? label;

  MetaData({this.field, this.label});

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);
}