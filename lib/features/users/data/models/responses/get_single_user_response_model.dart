import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../domain/entities/company_user.dart';
import '../../../domain/entities/get_single_user_result.dart';

part 'get_single_user_response_model.g.dart';

@JsonSerializable()
class GetSingleUserResponseModel extends GetSingleUserResult {
  GetSingleUserResponseModel({
    required super.user,
  });

  factory GetSingleUserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetSingleUserResponseModelFromJson(json);
}

@JsonSerializable()
class GetSingleUserResponse extends BaseAPIResponse {
  late GetSingleUserResponseModel? result;

  GetSingleUserResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory GetSingleUserResponse.fromJson(Map<String, dynamic>? json) =>
      _$GetSingleUserResponseFromJson(json!);
}
