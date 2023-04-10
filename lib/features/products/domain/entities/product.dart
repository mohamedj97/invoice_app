import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  late int id;
  int? companyId;
  String? code;
  String? brickcode;
  late String name;
  String? type;
  String? description;
  int? unittypeid;
  String? unittypecode;
  String? unittypename;
  String? unittypenamear;
  String? image;
  bool? active;
  num? price;

  Product({
    required this.id,
    this.companyId,
    this.code,
    this.brickcode,
    required this.name,
    this.type,
    this.description,
    this.unittypeid,
    this.unittypecode,
    this.unittypename,
    this.unittypenamear,
    this.price,
    this.image,
    this.active,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
