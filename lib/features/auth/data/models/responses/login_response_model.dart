import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/api/base_api_response.dart';
import '../../../domain/entities/login_response.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseDataModel extends LoginResponseData {
  LoginResponseDataModel({
    required super.token,
    required super.expiration,
  });

  factory LoginResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDataModelFromJson(json);
}

@JsonSerializable()
class LoginResponse extends BaseAPIResponse {
  late LoginResponseDataModel? result;

  LoginResponse({
    required super.statusCode,
    super.errorMessage,
    required this.result,
  });

  factory LoginResponse.fromJson(Map<String, dynamic>? json) =>
      _$LoginResponseFromJson(json!);
}
