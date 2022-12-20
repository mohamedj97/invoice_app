import 'package:equatable/equatable.dart';

class ProductRequest extends Equatable {
  int? id;
  int? companyId;
  String code;
  String brickcode;
  String name;
  String type;
  String description;
  int unittype;
  bool active;
  num price;

  ProductRequest({
    this.id,
    this.companyId,
    required this.code,
    required this.brickcode,
    required this.name,
    required this.type,
    required this.description,
    required this.unittype,
    required this.active,
    required this.price,
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
      ];
}
