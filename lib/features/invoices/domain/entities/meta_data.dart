import 'package:json_annotation/json_annotation.dart';
part 'meta_data.g.dart';
@JsonSerializable()
class MetaDataData{

  String? field;
  String? label;

  MetaDataData({this.field, this.label});


  factory MetaDataData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataDataFromJson(json);
}