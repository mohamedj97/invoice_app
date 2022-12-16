import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/customer_contact_person.dart';
import '../../../domain/entities/customer_request.dart';
import '../../../domain/entities/customer_ship_address.dart';

part 'customer_request_model.g.dart';

@JsonSerializable()
class CustomerModelModel extends CustomerRequest {
    CustomerModelModel(
      {super.companyid,
      super.code,
      super.name,
      super.identityid,
      super.countryid,
      super.countryname,
      super.countrynamear,
      super.countrycode,
      super.governateid,
      super.governatename,
      super.governatenamear,
      super.city,
      super.street,
      super.builldingnumber,
      super.postalcode,
      super.floor,
      super.room,
      super.landmark,
      super.additionalinformation,
      super.address,
      super.address2,
      super.typeid,
      super.typecode,
      super.typename,
      super.active,
      super.tel,
      super.fax,
      super.email,
      super.website,
      super.currencyid,
      super.currencycode,
      super.currencyname,
      super.currencynamear,
      super.itemid,
      super.itemcode,
      super.itemname,
      super.taxtypeid,
      super.taxtypecode,
      super.taxtypename,
      super.taxtypesubnamear,
      super.taxtypesubid,
      super.taxtypesubcode,
      super.taxtypesubname,
      super.taxrate,
      super.contactpersons,
      super.shipaddresses});

  @override
  String toString() {
    return 'CustomerModel[companyid=$companyid,  code=$code,  name=$name,  identityid=$identityid,  countryid=$countryid,  countryname=$countryname,  countrynamear=$countrynamear,  countrycode=$countrycode,  governateid=$governateid,  governatename=$governatename,  governatenamear=$governatenamear,  city=$city,  street=$street,  builldingnumber=$builldingnumber,  postalcode=$postalcode,  floor=$floor,  room=$room,  landmark=$landmark,  additionalinformation=$additionalinformation,  address=$address,  address2=$address2,  typeid=$typeid,  typecode=$typecode,  typename=$typename,  active=$active,  mobile=$mobile,  tel=$tel,  fax=$fax,  email=$email,  website=$website,  currencyid=$currencyid,  currencycode=$currencycode,  currencyname=$currencyname,  currencynamear=$currencynamear,  itemid=$itemid,  itemcode=$itemcode,  itemname=$itemname,  taxtypeid=$taxtypeid,  taxtypecode=$taxtypecode,  taxtypename=$taxtypename,  taxtypenamear=$taxtypenamear,  taxtypesubid=$taxtypesubid,  taxtypesubcode=$taxtypesubcode,  taxtypesubname=$taxtypesubname,  taxtypesubnamear=$taxtypesubnamear,  taxrate=$taxrate,  contactpersons=$contactpersons,  shipaddresses=$shipaddresses,  ]';
  }

  factory CustomerModelModel.fromJson(Map<String,dynamic> json) =>
      _$CustomerModelModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelModelToJson(this);
}


