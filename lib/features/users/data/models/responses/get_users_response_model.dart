import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../domain/entities/company_user.dart';
import '../../../domain/entities/get_users_result.dart';

part 'get_users_response_model.g.dart';

@JsonSerializable()
class GetUsersResponseModel extends GetUsersResult {
  GetUsersResponseModel({
    required super.users,
  });

  factory GetUsersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetUsersResponseModelFromJson(json);
}

@JsonSerializable()
class GetUsersResponse extends BaseAPIResponse {
  late GetUsersResponseModel? result;

  GetUsersResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory GetUsersResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetUsersResponseFromJson(json!);
}
