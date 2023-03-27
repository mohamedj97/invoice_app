// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_company_lookups_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCompanyLookupsResponseDataModel _$GetCompanyLookupsResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    GetCompanyLookupsResponseDataModel(
      businessActivity: (json['businessActivity'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      countries: (json['countries'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      etaEnvironment: (json['etaEnvironment'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      invoiceVersion: (json['invoiceVersion'] as List<dynamic>)
          .map((e) => BaseLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
      metaData: (json['metaData'] as List<dynamic>)
          .map((e) => Meta.fromJson(e as Map<String, dynamic>))
          .toList(),
      governates: (json['governates'] as List<dynamic>)
          .map((e) => GovernateLookup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCompanyLookupsResponseDataModelToJson(
        GetCompanyLookupsResponseDataModel instance) =>
    <String, dynamic>{
      'businessActivity': instance.businessActivity,
      'countries': instance.countries,
      'etaEnvironment': instance.etaEnvironment,
      'invoiceVersion': instance.invoiceVersion,
      'metaData': instance.metaData,
      'governates': instance.governates,
    };

GetCompanyLookupsResponse _$GetCompanyLookupsResponseFromJson(
        Map<String, dynamic> json) =>
    GetCompanyLookupsResponse(
      statuscode: json['statuscode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      result: json['result'] == null
          ? null
          : GetCompanyLookupsResponseDataModel.fromJson(
              json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCompanyLookupsResponseToJson(
        GetCompanyLookupsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'statuscode': instance.statuscode,
      'result': instance.result,
    };
