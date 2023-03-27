import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/company_register_model.dart';

part 'company_register_request_model.g.dart';

@JsonSerializable()
class CompanyRegisterRequestModel extends CompanyRegisterModel {
  CompanyRegisterRequestModel({
    required super.id,
    super.code,
    required super.name,
    required super.taxRegId,
    required super.activityid,
    required super.country,
    required super.governate,
    required super.city,
    required super.street,
    required super.builldingnumber,
    super.postalcode,
    super.floor,
    super.room,
    super.landmark,
    super.additionalinformation,
    super.address,
    super.address2,
    super.logo,
    super.taxAuthority,
    required super.active,
  });

  @override
  String toString() {
    return 'Company[id=$id,  code=$code,  name=$name,  taxRegId=$taxRegId,  activityid=$activityid,  country=$country,  governate=$governate,  city=$city,  street=$street,  builldingnumber=$builldingnumber,  postalcode=$postalcode,  floor=$floor,  room=$room,  landmark=$landmark,  additionalinformation=$additionalinformation,  address=$address,  address2=$address2,  logo=$logo,  taxAuthority=$taxAuthority,  active=$active,  ]';
  }

  factory CompanyRegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyRegisterRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyRegisterRequestModelToJson(this);
}
