import 'package:equatable/equatable.dart';

class ProductRequest extends Equatable {
  String code;
  String brickcode;
  String name;
  String type;
  String description;
  int unittype;
  bool active;
  num price;

  ProductRequest(
    this.code,
    this.brickcode,
    this.name,
    this.type,
    this.description,
    this.unittype,
    this.active,
    this.price,
  );

  @override
  List<Object> get props => [
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
