import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../../branches/domain/entities/company_branch.dart';
import '../../../../roles/domain/entities/company_role.dart';
import '../../../domain/entities/get_user_lookup_result.dart';

part 'get_user_lookup_response_model.g.dart';

@JsonSerializable()
class GetUserLookupResponseModel extends GetUserLookupResult {
  GetUserLookupResponseModel({
    required super.companybranchs,
    required super.userRoles,
  });

  factory GetUserLookupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetUserLookupResponseModelFromJson(json);
}

@JsonSerializable()
class GetUserLookupResponse extends BaseAPIResponse {
  late GetUserLookupResponseModel? result;

  GetUserLookupResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory GetUserLookupResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetUserLookupResponseFromJson(json!);
}
