import 'package:json_annotation/json_annotation.dart';
part'product.g.dart';

@JsonSerializable()
class Product {
  late int id;
  late int companyId;
  late String code;
  String? brickcode;
  String name;
  String? type;
  String? description;
  int? unittype;
  bool active;
  num? price;

  Product({
   required this.id,
    required  this.companyId,
    required  this.code,
    this.brickcode,
    required  this.name,
    this.type,
    this.description,
    this.unittype,
    this.price,
    required this.active,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}