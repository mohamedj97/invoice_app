// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_lookup_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyLookUpResult _$CompanyLookUpResultFromJson(Map<String, dynamic> json) =>
    CompanyLookUpResult(
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

Map<String, dynamic> _$CompanyLookUpResultToJson(
        CompanyLookUpResult instance) =>
    <String, dynamic>{
      'businessActivity': instance.businessActivity,
      'countries': instance.countries,
      'etaEnvironment': instance.etaEnvironment,
      'invoiceVersion': instance.invoiceVersion,
      'metaData': instance.metaData,
      'governates': instance.governates,
    };
