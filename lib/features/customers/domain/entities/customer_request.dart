import 'package:equatable/equatable.dart';

class CustomerRequest extends Equatable {
  String? mobile;
  String? tel;
  String? fax;
  String? email;
  String? website;
  int? currencyid;
  int? itemid;
  int? taxtypeid;
  int? taxtypetubid;
  num? taxrate;
  late int id;
  late int companyid;
  late int type;
  String? code;
  late String name;
  int? identityid;
  int? country;
  int? governate;
  String? city;
  String? street;
  String? builldingnumber;
  String? postalcode;
  String? floor;
  String? room;
  String? landmark;
  String? additionalinformation;
  String? address;
  String? address2;
  late bool active;

  CustomerRequest({
    this.mobile,
    this.tel,
    this.fax,
    this.email,
    this.website,
    this.currencyid,
    this.itemid,
    this.taxtypeid,
    this.taxtypetubid,
    this.taxrate,
    required this.id,
    required this.companyid,
    required this.type,
    this.code,
    required this.name,
    this.identityid,
    this.country,
    this.governate,
    this.city,
    this.street,
    this.builldingnumber,
    this.postalcode,
    this.floor,
    this.room,
    this.landmark,
    this.additionalinformation,
    this.address,
    this.address2,
    required this.active,
  });

  @override
  List<Object?> get props => [
        {
          mobile,
          tel,
          fax,
          email,
          website,
          currencyid,
          itemid,
          taxtypeid,
          taxtypetubid,
          taxrate,
          id,
          companyid,
          type,
          code,
          name,
          identityid,
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
          active,
        }
      ];
}
