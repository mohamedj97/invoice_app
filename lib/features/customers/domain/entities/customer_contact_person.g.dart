// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_contact_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerContactPerson _$CustomerContactPersonFromJson(
        Map<String, dynamic> json) =>
    CustomerContactPerson(
      id: json['id'] as int,
      customerId: json['customerId'] as int,
      name: json['name'] as String?,
      mobile: json['mobile'] as String?,
      tel: json['tel'] as String?,
      fax: json['fax'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      address2: json['address2'] as String?,
    );

Map<String, dynamic> _$CustomerContactPersonToJson(
        CustomerContactPerson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'name': instance.name,
      'mobile': instance.mobile,
      'tel': instance.tel,
      'fax': instance.fax,
      'email': instance.email,
      'address': instance.address,
      'address2': instance.address2,
    };
