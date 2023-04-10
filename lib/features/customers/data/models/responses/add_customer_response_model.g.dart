// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_customer_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCustomerResponseDataModel _$AddCustomerResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    AddCustomerResponseDataModel(
      id: json['id'] as int,
      companyid: json['companyid'] as int,
      code: json['code'] as String?,
      name: json['name'] as String?,
      identityid: json['identityid'] as num?,
      countryid: json['countryid'] as int?,
      countryname: json['countryname'] as String?,
      countrynamear: json['countrynamear'] as String?,
      countrycode: json['countrycode'] as String?,
      governateid: json['governateid'] as int?,
      governatename: json['governatename'] as String?,
      governatenamear: json['governatenamear'] as String?,
      city: json['city'] as String?,
      street: json['street'] as String?,
      builldingnumber: json['builldingnumber'] as String?,
      postalcode: json['postalcode'] as String?,
      floor: json['floor'] as String?,
      room: json['room'] as String?,
      landmark: json['landmark'] as String?,
      additionalinformation: json['additionalinformation'] as String?,
      address: json['address'] as String?,
      address2: json['address2'] as String?,
      typeid: json['typeid'] as int,
      typecode: json['typecode'] as String?,
      typename: json['typename'] as String?,
      active: json['active'] as bool,
      tel: json['tel'] as String?,
      fax: json['fax'] as String?,
      email: json['email'] as String?,
      website: json['website'] as String?,
      currencyid: json['currencyid'] as int,
      currencycode: json['currencycode'] as String?,
      currencyname: json['currencyname'] as String?,
      currencynamear: json['currencynamear'] as String?,
      itemid: json['itemid'] as int,
      itemcode: json['itemcode'] as String?,
      itemname: json['itemname'] as String?,
      taxtypeid: json['taxtypeid'] as int,
      taxtypecode: json['taxtypecode'] as String?,
      taxtypename: json['taxtypename'] as String?,
      taxtypesubnamear: json['taxtypesubnamear'] as String?,
      taxtypesubid: json['taxtypesubid'] as int,
      taxtypesubcode: json['taxtypesubcode'] as String?,
      taxtypesubname: json['taxtypesubname'] as String?,
      taxrate: json['taxrate'] as num,
      contactpersons: (json['contactpersons'] as List<dynamic>?)
          ?.map(
              (e) => CustomerContactPerson.fromJson(e as Map<String, dynamic>))
          .toList(),
      shipaddresses: (json['shipaddresses'] as List<dynamic>?)
          ?.map((e) => CustomerShipAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..mobile = json['mobile'] as String?
      ..taxtypenamear = json['taxtypenamear'] as String?;

Map<String, dynamic> _$AddCustomerResponseDataModelToJson(
        AddCustomerResponseDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyid': instance.companyid,
      'code': instance.code,
      'name': instance.name,
      'identityid': instance.identityid,
      'countryid': instance.countryid,
      'countryname': instance.countryname,
      'countrynamear': instance.countrynamear,
      'countrycode': instance.countrycode,
      'governateid': instance.governateid,
      'governatename': instance.governatename,
      'governatenamear': instance.governatenamear,
      'city': instance.city,
      'street': instance.street,
      'builldingnumber': instance.builldingnumber,
      'postalcode': instance.postalcode,
      'floor': instance.floor,
      'room': instance.room,
      'landmark': instance.landmark,
      'additionalinformation': instance.additionalinformation,
      'address': instance.address,
      'address2': instance.address2,
      'typeid': instance.typeid,
      'typecode': instance.typecode,
      'typename': instance.typename,
      'active': instance.active,
      'mobile': instance.mobile,
      'tel': instance.tel,
      'fax': instance.fax,
      'email': instance.email,
      'website': instance.website,
      'currencyid': instance.currencyid,
      'currencycode': instance.currencycode,
      'currencyname': instance.currencyname,
      'currencynamear': instance.currencynamear,
      'itemid': instance.itemid,
      'itemcode': instance.itemcode,
      'itemname': instance.itemname,
      'taxtypeid': instance.taxtypeid,
      'taxtypecode': instance.taxtypecode,
      'taxtypename': instance.taxtypename,
      'taxtypenamear': instance.taxtypenamear,
      'taxtypesubid': instance.taxtypesubid,
      'taxtypesubcode': instance.taxtypesubcode,
      'taxtypesubname': instance.taxtypesubname,
      'taxtypesubnamear': instance.taxtypesubnamear,
      'taxrate': instance.taxrate,
      'contactpersons': instance.contactpersons,
      'shipaddresses': instance.shipaddresses,
    };

AddCustomerResponse _$AddCustomerResponseFromJson(Map<String, dynamic> json) =>
    AddCustomerResponse(
      statuscode: json['statuscode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      result: json['result'] == null
          ? null
          : AddCustomerResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddCustomerResponseToJson(
        AddCustomerResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
