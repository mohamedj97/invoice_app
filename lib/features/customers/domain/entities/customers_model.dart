import 'package:invoice_app/features/customers/domain/entities/customer_contact_person.dart';
import 'package:invoice_app/features/customers/domain/entities/customer_ship_address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customers_model.g.dart';

@JsonSerializable()
class CustomersModel {
  late int id;
  late int companyid;
  String? code;
  String? name;
  int? identityid;
  int? countryid;
  String? countryname;
  String? countrynamear;
  String? countrycode;
  int ?governateid;
  String? governatename;
  String? governatenamear;
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
  int? typeid;
  String? typecode;
  String? typename;
  late bool active;
  String? status;
  String? mobile;
  String? tel;
  String? fax;
  String? email;
  String? website;
  int? currencyid;
  String? currencycode;
  String? currencyname;
  String? currencynamear;
   int? itemid;
  String? itemcode;
  String? itemname;
   int? taxtypeid;
  String? taxtypecode;
  String? taxtypename;
  String? taxtypenamear;
  int? taxtypesubid;
  String? taxtypesubcode;
  String? taxtypesubname;
  String? taxtypesubnamear;
  num? taxrate;
  List<CustomerContactPerson>? contactpersons;
  List<CustomerShipAddress>? shipaddresses;

  CustomersModel({
    required this.id,
    required this.companyid,
    this.code,
    this.name,
    this.identityid,
    this.countryid,
    this.countryname,
    this.countrynamear,
    this.countrycode,
    this.governateid,
    this.governatename,
    this.governatenamear,
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
    this.typeid,
    this.typecode,
    this.typename,
    required this.active,
    this.status,
    this.mobile,
    this.tel,
    this.fax,
    this.email,
    this.website,
    this.currencyid,
    this.currencycode,
    this.currencyname,
    this.currencynamear,
    this.itemid,
    this.itemcode,
    this.itemname,
    this.taxtypeid,
    this.taxtypecode,
    this.taxtypename,
    this.taxtypenamear,
    this.taxtypesubid,
    this.taxtypesubcode,
    this.taxtypesubname,
    this.taxtypesubnamear,
    this.taxrate,
    this.contactpersons,
    this.shipaddresses,
  });

  factory CustomersModel.fromJson(Map<String, dynamic> json) => _$CustomersModelFromJson(json);
}
