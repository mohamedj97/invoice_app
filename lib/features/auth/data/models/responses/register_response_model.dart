import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../domain/entities/register_response.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseDataModel extends RegisterResponseData {
  RegisterResponseDataModel({
    required super.securityCodeValideTime,
    required super.userId,
     super.email,
    required super.active,
    required super.selcompany,
    super.token,
    super.loginId,
  });

  factory RegisterResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseDataModelFromJson(json);
}

@JsonSerializable()
class RegisterResponse extends BaseAPIResponse {
  late RegisterResponseDataModel? result;

  RegisterResponse({
    required super.statuscode,
    super.message,
    required this.result,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic>? json) =>
      _$RegisterResponseFromJson(json!);
}
