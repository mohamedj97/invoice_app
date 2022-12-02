import 'package:invoice_app/features/customers/domain/entities/customer_contact_person.dart';
import 'package:invoice_app/features/customers/domain/entities/customer_ship_address.dart';
import 'package:json_annotation/json_annotation.dart';
part 'customer_entity.g.dart';
@JsonSerializable()
class CustomerModel{
  late int id;
  late int companyid;
  String? code;
  String? name;
  num identityid;
  int? countryid;
  String? countryname;
  String? countrynamear;
  String? countrycode;
  int? governateid;
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
  int typeid;
  String? typecode;
  String? typename;
  bool active;
  String? mobile;
  String? tel;
  String? fax;
  String? email;
  String? website;
  int currencyid;
  String? currencycode;
  String? currencyname;
  String? currencynamear;
  int itemid;
  String? itemcode;
  String? itemname;
  int taxtypeid;
  String? taxtypecode;
  String? taxtypename;
  String? taxtypenamear;
  int taxtypesubid;
  String? taxtypesubcode;
  String? taxtypesubname;
  String? taxtypesubnamear;
  num taxrate;
  List<CustomerContactPerson>? contactpersons;
  List<CustomerShipAddress>? shipaddresses;

  CustomerModel(
      {required this.id,
        required this.companyid,
        this.code,
        this.name,
        required this.identityid,
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
        required this.typeid,
        this.typecode,
        this.typename,
        required this.active,
        this.tel,
        this.fax,
        this.email,
        this.website,
        required this.currencyid,
        this.currencycode,
        this.currencyname,
        this.currencynamear,
        required this.itemid,
        this.itemcode,
        this.itemname,
        required this.taxtypeid,
        this.taxtypecode,
        this.taxtypename,
        this.taxtypesubnamear,
        required this.taxtypesubid,
        this.taxtypesubcode,
        this.taxtypesubname,
        required this.taxrate,
        this.contactpersons,
        this.shipaddresses});

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}
