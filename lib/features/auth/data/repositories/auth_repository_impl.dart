import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/mixins/app_mixins.dart';
import '../../domain/entities/login_request.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/remote_data_sources/auth_remote_data_source.dart';
import '../models/requests/login_request_model.dart';
import '../models/responses/login_response_model.dart';

class AuthRepositoryImpl extends AuthRepository with ConnectivityMixin {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, LoginResponse>> login(
      LoginRequest loginRequest) async {
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
}
