// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_contact_person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerContactPerson _$CustomerContactPersonFromJson(
        Map<String, dynamic> json) =>
    CustomerContactPerson(
      id: json['Id'] as int,
      customerId: json['CustomerId'] as int,
      name: json['Name'] as String?,
      mobile: json['Mobile'] as String?,
      tel: json['Tel'] as String?,
      fax: json['Fax'] as String?,
      email: json['Email'] as String?,
      address: json['Address'] as String?,
      address2: json['Address2'] as String?,
    );

Map<String, dynamic> _$CustomerContactPersonToJson(
        CustomerContactPerson instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'CustomerId': instance.customerId,
      'Name': instance.name,
      'Mobile': instance.mobile,
      'Tel': instance.tel,
      'Fax': instance.fax,
      'Email': instance.email,
      'Address': instance.address,
      'Address2': instance.address2,
    };
