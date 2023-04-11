import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../domain/entities/customer_contact_person.dart';
import '../../../domain/entities/customer_entity.dart';
import '../../../domain/entities/customer_ship_address.dart';

part 'add_customer_response_model.g.dart';

@JsonSerializable()
class AddCustomerResponseDataModel extends GetCustomerModel {
  AddCustomerResponseDataModel({
    super.mobile,
    super.tel,
    super.fax,
    super.email,
    super.website,
    super.currencyid,
    super.itemid,
    super.taxtypeid,
    required super.taxtypetubid,
    required super.taxrate,
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
    super.contactpersons,
    super.shipaddresses,
  });

  factory AddCustomerResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$AddCustomerResponseDataModelFromJson(json);
}


@JsonSerializable()
class AddCustomerResponse extends BaseAPIResponse {
  late AddCustomerResponseDataModel? result;

  AddCustomerResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory AddCustomerResponse.fromJson(Map<String, dynamic>? json) =>
      _$AddCustomerResponseFromJson(json!);
}
