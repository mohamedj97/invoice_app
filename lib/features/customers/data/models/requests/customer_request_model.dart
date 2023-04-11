import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/customer_request.dart';

part 'customer_request_model.g.dart';

@JsonSerializable()
class CustomerModelModel extends CustomerRequest {
  CustomerModelModel({
    super.mobile,
    super.tel,
    super.fax,
    super.email,
    super.website,
    super.currencyid,
    super.itemid,
    super.taxtypeid,
     super.taxtypetubid,
     super.taxrate,
    required super.id,
    required super.companyid,
    required super.type,
    super.code,
    required super.name,
    super.identityid,
    super.country,
    super.governate,
    super.city,
    super.street,
    super.builldingnumber,
    super.postalcode,
    super.floor,
    super.room,
    super.landmark,
    super.additionalinformation,
    super.address,
    super.address2,
    required super.active,
  });

  @override
  String toString() {
    return 'CustomerModel[id=$id,  companyid=$companyid,  code=$code,  name=$name,  identityid=$identityid,  taxtypetubid=$taxtypetubid,  type=$type,  country=$country,  governate=$governate,  city=$city,  street=$street,  builldingnumber=$builldingnumber,  postalcode=$postalcode,  floor=$floor,  room=$room,  landmark=$landmark,  additionalinformation=$additionalinformation,  address=$address,  address2=$address2,  active=$active,  mobile=$mobile,  tel=$tel,  fax=$fax,  email=$email,  website=$website,  currencyid=$currencyid,  itemid=$itemid,  taxtypeid=$taxtypeid,  taxrate=$taxrate,  ]';
  }

  factory CustomerModelModel.fromJson(Map<String, dynamic> json) => _$CustomerModelModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerModelModelToJson(this);
}
