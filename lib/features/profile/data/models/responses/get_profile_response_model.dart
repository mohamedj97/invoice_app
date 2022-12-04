import 'package:invoice_app/features/profile/domain/entities/company_role.dart';
import 'package:invoice_app/features/profile/domain/entities/user_company.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../domain/entities/user_info_data.dart';

part 'get_profile_response_model.g.dart';

@JsonSerializable()
class GetProfileResponseDataModel extends UserInfoData {
  GetProfileResponseDataModel({
    required super.userId,
    super.loginId,
    super.userName,
    super.email,
    required super.companies,
    required super.roles,
  });

  factory GetProfileResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetProfileResponseDataModelFromJson(json);
}

@JsonSerializable()
class GetProfileResponse extends BaseAPIResponse {
  late GetProfileResponseDataModel? result;

  GetProfileResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory GetProfileResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetProfileResponseFromJson(json!);
}
