import 'package:invoice_app/features/auth/data/models/requests/register_request_model.dart';
import 'package:invoice_app/features/auth/data/models/responses/register_response_model.dart';

import '../../../../../core/api/api_repo.dart';
import '../../models/requests/login_request_model.dart';
import '../../models/responses/login_response_model.dart';
import '../../models/responses/validate_code_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponse> login(LoginModel loginRequest);
  Future<RegisterResponse> register(RegisterModel registerRequest);
  Future<RegisterResponse> resendCode({required int userId});
  Future<ValidateCodeResponse> validateSecurityCode({required int userId,required String securityCode});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final APIRepository apiRepo;
  AuthRemoteDataSourceImpl({
    required this.apiRepo,
  });
  @override
  Future<LoginResponse> login(LoginModel loginRequest) async {
    final response = await apiRepo.authClient.login(loginRequest);

    return response;
  }

  @override
  Future<RegisterResponse> register(RegisterModel registerRequest) async {
    final response = await apiRepo.authClient.register(registerRequest);

    return response;
  }

  @override
  Future<ValidateCodeResponse> validateSecurityCode({required int userId, required String securityCode}) async{
    final response = await apiRepo.authClient.validateSecurityCode(securityCode: securityCode,userId: userId);

    return response;
  }

  @override
  Future<RegisterResponse> resendCode({required int userId}) async{
    final response = await apiRepo.authClient.resendCode(userId: userId);

    return response;
  }
}