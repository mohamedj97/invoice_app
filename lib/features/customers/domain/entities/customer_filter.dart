import 'package:json_annotation/json_annotation.dart';
part 'customer_filter.g.dart';

@JsonSerializable()
class CustomerFilter{
  CustomerFilter({
    this.freeText,
    this.customerType,
    this.country,
    this.identityId,
    this.active,
    this.customerName,
  });

  String? freeText;
  int? customerType;
  String? customerName;
  int? country;
  int? identityId;
  bool? active;


  Map<String, dynamic> toJson() => {
    "freeText": freeText,
    "invoiceNo": customerType,
    "customerName": customerName,
    "country": country,
    "identityId": identityId,
    "active": active,

  };
  factory CustomerFilter.fromJson(Map<String, dynamic> json) => _$CustomerFilterFromJson(json);
}
