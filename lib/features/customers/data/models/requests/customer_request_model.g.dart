// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModelModel _$CustomerModelModelFromJson(Map<String, dynamic> json) =>
    CustomerModelModel(
      mobile: json['mobile'] as String?,
      tel: json['tel'] as String?,
      fax: json['fax'] as String?,
      email: json['email'] as String?,
      website: json['website'] as String?,
      currencyid: json['currencyid'] as int?,
      itemid: json['itemid'] as int?,
      taxtypeid: json['taxtypeid'] as int?,
      taxtypetubid: json['taxtypetubid'] as int,
      taxrate: json['taxrate'] as num,
      id: json['id'] as int,
      companyid: json['companyid'] as int,
      type: json['type'] as int,
      code: json['code'] as String?,
      name: json['name'] as String,
      identityid: json['identityid'] as int?,
      country: json['country'] as int?,
      governate: json['governate'] as int?,
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
      active: json['active'] as bool,
    );

Map<String, dynamic> _$CustomerModelModelToJson(CustomerModelModel instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
      'tel': instance.tel,
      'fax': instance.fax,
      'email': instance.email,
      'website': instance.website,
      'currencyid': instance.currencyid,
      'itemid': instance.itemid,
      'taxtypeid': instance.taxtypeid,
      'taxtypetubid': instance.taxtypetubid,
      'taxrate': instance.taxrate,
      'id': instance.id,
      'companyid': instance.companyid,
      'type': instance.type,
      'code': instance.code,
      'name': instance.name,
      'identityid': instance.identityid,
      'country': instance.country,
      'governate': instance.governate,
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
      'active': instance.active,
    };
