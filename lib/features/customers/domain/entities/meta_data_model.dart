import 'package:json_annotation/json_annotation.dart';
part 'meta_data_model.g.dart';
@JsonSerializable()
class MetaDataModel{

  String? field;
  String? label;

  MetaDataModel({this.field, this.label});

  factory MetaDataModel.fromJson(Map<String, dynamic> json) =>
      _$MetaDataModelFromJson(json);
}