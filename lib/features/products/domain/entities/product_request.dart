import 'package:equatable/equatable.dart';

class ProductRequest extends Equatable {
  int id;
  int companyId;
  String code;
  String brickcode;
  String name;
  String type;
  String description;
  int unittype;
  bool active;

  ProductRequest(
    this.id,
    this.companyId,
    this.code,
    this.brickcode,
    this.name,
    this.type,
    this.description,
    this.unittype,
    this.active,
  );

  @override
  List<Object> get props => [
    id,
    companyId,
    code,
    brickcode,
    name,
    type,
    description,
    unittype,
    active,
      ];
}
