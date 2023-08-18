import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/auth/data/models/responses/register_response_model.dart';
import 'package:invoice_app/features/auth/domain/entities/register_request.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/login_response_model.dart';
import '../../data/models/responses/validate_code_response_model.dart';
import '../entities/login_request.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> login(LoginRequest loginRequest);
  Future<Either<Failure, RegisterResponse>> register(RegisterRequest registerRequest);
  Future<Either<Failure, RegisterResponse>> resendCode({required int userId});
  Future<Either<Failure, BoolResponse>> deleteUser({required int userId});
  Future<Either<Failure, ValidateCodeResponse>> validateSecurityCode({required int userId,required String securityCode});
}
