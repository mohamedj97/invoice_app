import 'package:json_annotation/json_annotation.dart';
part 'customer_contact_person.g.dart';

@JsonSerializable()
class CustomerContactPerson{
  late int id;
  late int customerId;
  String? name;
  String? mobile;
  String? tel;
  String? fax;
  String? email;
  String? address;
  String? address2;

  CustomerContactPerson({required this.id,required this.customerId, this.name, this.mobile,
      this.tel, this.fax, this.email, this.address, this.address2});

  factory CustomerContactPerson.fromJson(Map<String, dynamic> json) =>
      _$CustomerContactPersonFromJson(json);
}