import 'package:equatable/equatable.dart';

import 'customer_contact_person.dart';
import 'customer_ship_address.dart';

class CustomerRequest extends Equatable {
  int? companyid;
  int? id;
  String? code;
  String? name;
  num? identityid;
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
  int? typeid;
  String? typecode;
  String? typename;
  bool? active;
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

  CustomerRequest(
      {this.companyid,
      this.code,
      this.id,
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
      this.active,
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
      this.taxtypesubnamear,
      this.taxtypesubid,
      this.taxtypesubcode,
      this.taxtypesubname,
      this.taxrate,
      this.contactpersons,
      this.shipaddresses});

  @override
  List<Object> get props => [
        {
          companyid,
          id,
          code,
          name,
          identityid,
          countryid,
          countryname,
          countrynamear,
          countrycode,
          governateid,
          governatename,
          governatenamear,
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
          typeid,
          typecode,
          typename,
          active,
          tel,
          fax,
          email,
          website,
          currencyid,
          currencycode,
          currencyname,
          currencynamear,
          itemid,
          itemcode,
          itemname,
          taxtypeid,
          taxtypecode,
          taxtypename,
          taxtypesubnamear,
          taxtypesubid,
          taxtypesubcode,
          taxtypesubname,
          taxrate,
          contactpersons,
          shipaddresses
        }
      ];
}
