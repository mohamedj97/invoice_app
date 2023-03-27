import 'package:equatable/equatable.dart';

class CompanyRegisterModel extends Equatable {
  CompanyRegisterModel({
    required this.id,
    this.code,
    required this.name,
    required this.taxRegId,
    required this.activityid,
    required this.country,
    required this.governate,
    required this.city,
    required this.street,
    required this.builldingnumber,
    this.postalcode,
    this.floor,
    this.room,
    this.landmark,
    this.additionalinformation,
    this.address,
    this.address2,
    this.logo,
    this.taxAuthority,
    required this.active,
  });

  int id;
  String? code;
  String name;
  int taxRegId;
  int activityid;
  int country;
  int governate;
  String city;
  String street;
  String builldingnumber;
  String? postalcode;
  String? floor;
  String? room;
  String? landmark;
  String? additionalinformation;
  String? address;
  String? address2;
  String? logo;
  int? taxAuthority;
  bool active;

  @override
  List<Object?> get props => [
        id,
        code,
        name,
        taxRegId,
        activityid,
        country,
        governate,
        city,
        street,
        builldingnumber,
        postalcode,
        floor,
        room,
        landmark,
        additionalinformation,
        address,
        address2,
        logo,
        taxAuthority,
        active,
      ];
}
