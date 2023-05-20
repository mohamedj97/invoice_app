import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/users/data/data_sources/users_remote_data_source.dart';
import 'package:invoice_app/features/users/data/models/responses/get_single_user_response_model.dart';
import 'package:invoice_app/features/users/data/models/responses/get_user_lookup_response_model.dart';
import 'package:invoice_app/features/users/domain/entities/user_request.dart';
import 'package:invoice_app/features/users/domain/repositories/users_repositories.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/mixins/app_mixins.dart';
import '../models/responses/get_users_response_model.dart';

class UsersRepositoryImpl extends UsersRepository with ConnectivityMixin {
  final UsersRemoteDataSource usersRemoteDataSource;

  UsersRepositoryImpl(this.usersRemoteDataSource);

  @override
  Future<Either<Failure, GetUsersResponse>> getCompanyUsers() async {
    try {
      final response = await usersRemoteDataSource.getCompanyUsers();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetSingleUserResponse>> getSingleUser({required int id}) async {
    try {
      final response = await usersRemoteDataSource.getSingleUser(id: id);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetUserLookupResponse>> getCompanyUserLookup({required int id}) async {
    try {
      final response = await usersRemoteDataSource.getCompanyUserLookup(id: id);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetSingleUserResponse>> addUser({required UserRequest userRequest}) async {
    try {
      final response = await usersRemoteDataSource.addUser(userRequest: userRequest);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, BoolResponse>> editUser({required int id, required UserRequest userRequest}) async {
    try {
      final response = await usersRemoteDataSource.editUser(id: id, userRequest: userRequest);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }
}
