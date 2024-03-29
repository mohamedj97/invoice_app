import 'package:dio/dio.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../core/api/repository/memory_repo.dart';
import '../../../core/strings/end_points.dart';
import '../data/models/requests/login_request_model.dart';
import '../data/models/requests/register_request_model.dart';
import '../data/models/responses/login_response_model.dart';
import '../data/models/responses/register_response_model.dart';
import '../data/models/responses/validate_code_response_model.dart';

part 'auth_client.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST(EndPoints.login)
  Future<LoginResponse> login(@Body() LoginModel loginRequest);

  @POST(EndPoints.register)
  Future<RegisterResponse> register(@Body() RegisterModel registerRequest);

  @POST(EndPoints.resendCode)
  Future<RegisterResponse> resendCode({required int userId});

  @POST(EndPoints.deleteUser)
  Future<BoolResponse> deleteUser({required int userId});

  @POST(EndPoints.validateSecurityCode)
  Future<ValidateCodeResponse> validateSecurityCode({required int userId,required String securityCode});
}
