import 'package:equatable/equatable.dart';

class ProductRequest extends Equatable {
  int? id;
  int? companyId;
  String? code;
  String? brickcode;
  String name;
  String? type;
  String? description;
  int? unittype;
  bool active;
  num? price;
  String? image;

  ProductRequest({
    this.id,
    this.companyId,
    this.code,
    this.brickcode,
    required this.name,
    this.type,
    this.description,
    this.unittype,
    required this.active,
    this.price,
    this.image,
  });

  @override
  List<Object?> get props => [
        id,
        companyId,
        code,
        brickcode,
        name,
        type,
        description,
        unittype,
        active,
        price,
        image,
      ];
}
