import 'package:invoice_app/features/customers/domain/entities/customer_contact_person.dart';
import 'package:invoice_app/features/customers/domain/entities/customer_ship_address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customer_entity.g.dart';

@JsonSerializable()
class GetCustomerModel {
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
  int id;
  int companyid;
  int type;
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
  bool active;
  List<CustomerContactPerson>? contactpersons;
  List<CustomerShipAddress>? shipaddresses;

  GetCustomerModel({
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
    this.contactpersons,
    this.shipaddresses,
  });

  factory GetCustomerModel.fromJson(Map<String, dynamic> json) => _$GetCustomerModelFromJson(json);
}
