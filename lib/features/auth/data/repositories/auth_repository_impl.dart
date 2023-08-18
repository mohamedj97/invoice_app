import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/auth/data/models/responses/register_response_model.dart';
import 'package:invoice_app/features/auth/data/models/responses/validate_code_response_model.dart';
import 'package:invoice_app/features/auth/domain/entities/register_request.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/mixins/app_mixins.dart';
import '../../domain/entities/login_request.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/remote_data_sources/auth_remote_data_source.dart';
import '../models/requests/login_request_model.dart';
import '../models/requests/register_request_model.dart';
import '../models/responses/login_response_model.dart';

class AuthRepositoryImpl extends AuthRepository with ConnectivityMixin {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final response = await remoteDataSource.login(LoginModel(
        loginRequest.username,
        loginRequest.password,
      ));

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, RegisterResponse>> register(RegisterRequest registerRequest) async {
    try {
      final response = await remoteDataSource.register(RegisterModel(
        ConfirmedPassword: registerRequest.ConfirmedPassword,
        Password: registerRequest.Password,
        Email: registerRequest.Email,
        Username: registerRequest.Username,
      ));

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ValidateCodeResponse>> validateSecurityCode(
      {required int userId, required String securityCode}) async {
    try {
      final response = await remoteDataSource.validateSecurityCode(userId: userId, securityCode: securityCode);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, RegisterResponse>> resendCode({required int userId}) async {
    try {
      final response = await remoteDataSource.resendCode(userId: userId);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, BoolResponse>> deleteUser({required int userId}) async {
    try {
      final response = await remoteDataSource.deleteUser(userId: userId);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }
}
