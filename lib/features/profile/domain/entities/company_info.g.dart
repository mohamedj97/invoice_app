// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyInfo _$CompanyInfoFromJson(Map<String, dynamic> json) => CompanyInfo(
      id: json['id'] as int,
      code: json['code'] as String,
      name: json['name'] as String,
      taxRegId: json['taxRegId'] as num,
      activityid: json['activityid'] as int,
      country: json['country'] as int,
      governate: json['governate'] as int,
      city: json['city'] as String,
      street: json['street'] as String,
      builldingnumber: json['builldingnumber'] as String,
      postalcode: json['postalcode'] as String?,
      floor: json['floor'] as String?,
      room: json['room'] as String?,
      landmark: json['landmark'] as String?,
      additionalinformation: json['additionalinformation'] as String?,
      address: json['address'] as String?,
      address2: json['address2'] as String?,
      logo: json['logo'] as String?,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$CompanyInfoToJson(CompanyInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'taxRegId': instance.taxRegId,
      'activityid': instance.activityid,
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
      'logo': instance.logo,
      'active': instance.active,
    };
