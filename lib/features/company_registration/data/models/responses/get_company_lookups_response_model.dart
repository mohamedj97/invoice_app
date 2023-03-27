import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../../products/domain/entities/base_lookup.dart';
import '../../../../products/domain/entities/meta.dart';
import '../../../domain/entities/company_lookup_result.dart';
import '../../../domain/entities/governate_lookup.dart';

part 'get_company_lookups_response_model.g.dart';

@JsonSerializable()
class GetCompanyLookupsResponseDataModel extends CompanyLookUpResult {
  GetCompanyLookupsResponseDataModel({
    required super.businessActivity,
    required super.countries,
    required super.etaEnvironment,
    required super.invoiceVersion,
    required super.metaData,
    required super.governates,
  });

  factory GetCompanyLookupsResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetCompanyLookupsResponseDataModelFromJson(json);
}

@JsonSerializable()
class GetCompanyLookupsResponse extends BaseAPIResponse {
  late GetCompanyLookupsResponseDataModel? result;

  GetCompanyLookupsResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory GetCompanyLookupsResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetCompanyLookupsResponseFromJson(json!);
}