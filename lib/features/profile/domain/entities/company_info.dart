import 'package:json_annotation/json_annotation.dart';
part 'company_info.g.dart';

@JsonSerializable()
class CompanyInfo {
  late int id;
  late String code;
  late String name;
  late int taxRegId;
  late int activityid;
  late int country;
  late int governate;
  late String city;
  late String street;
  late String builldingnumber;
  String? postalcode;
  String? floor;
  String? room;
  String? landmark;
  String? additionalinformation;
  String? address;
  String? address2;
  String? logo;
  late bool active;

  CompanyInfo({
    required this.id,
    required this.code,
    required this.name,
    required this.taxRegId,
    required this.activityid,
    required this.country,
    required this.governate,
    required this.city,
    required this.street,
    required this.builldingnumber,
    this.postalcode,
    this.floor,
    this.room,
    this.landmark,
    this.additionalinformation,
    this.address,
    this.address2,
    this.logo,
    required this.active,
  });
  factory CompanyInfo.fromJson(Map<String, dynamic> json) =>
      _$CompanyInfoFromJson(json);
}
