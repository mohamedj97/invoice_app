import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../domain/entities/customer_contact_person.dart';
import '../../../domain/entities/customer_entity.dart';
import '../../../domain/entities/customer_ship_address.dart';

part 'add_customer_response_model.g.dart';

@JsonSerializable()
class AddCustomerResponseDataModel extends CustomerModel {
  AddCustomerResponseDataModel({
    required super.id,
    required super.companyid,
    super.code,
    super.name,
    required super.identityid,
    super.countryid,
    super.countryname,
    super.countrynamear,
    super.countrycode,
    super.governateid,
    super.governatename,
    super.governatenamear,
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
    required super.typeid,
    super.typecode,
    super.typename,
    required super.active,
    super.tel,
    super.fax,
    super.email,
    super.website,
    required super.currencyid,
    super.currencycode,
    super.currencyname,
    super.currencynamear,
    required super.itemid,
    super.itemcode,
    super.itemname,
    required super.taxtypeid,
    super.taxtypecode,
    super.taxtypename,
    super.taxtypesubnamear,
    required super.taxtypesubid,
    super.taxtypesubcode,
    super.taxtypesubname,
    required super.taxrate,
    super.contactpersons,
    super.shipaddresses
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
