import 'package:json_annotation/json_annotation.dart';
part 'customer_ship_address.g.dart';

@JsonSerializable()
class CustomerShipAddress {
  late int id;
  late  int customerId;
  late  int shipTypeId;
  String? shipTypeName;
  String? title;
  late  int countryId;
  String? countryCode;
  String? countryName;
  String? countryNamear;
  int governateId;
  String? governateName;
  String? governateNamear;
  String? city;
  String? street;
  String? builldingnumber;
  String? additionalinformation;
  bool? active;

  CustomerShipAddress(
      {required this.id,
      required this.customerId,
      required this.shipTypeId,
      this.shipTypeName,
      this.title,
      required this.countryId,
      this.countryCode,
      this.countryName,
      this.countryNamear,
      required this.governateId,
      this.governateName,
      this.governateNamear,
      this.city,
      this.street,
      this.builldingnumber,
      this.additionalinformation,
      this.active});

  factory CustomerShipAddress.fromJson(Map<String, dynamic> json) =>
      _$CustomerShipAddressFromJson(json);
}
