import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/users/data/models/responses/get_single_user_response_model.dart';
import 'package:invoice_app/features/users/data/models/responses/get_users_response_model.dart';
import 'package:invoice_app/features/users/domain/entities/user_request.dart';
import '../../../../core/api/base_api_response.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/get_user_lookup_response_model.dart';

abstract class UsersRepository {
  Future<Either<Failure, GetUsersResponse>> getCompanyUsers();
  Future<Either<Failure, GetSingleUserResponse>> getSingleUser({required int id});
  Future<Either<Failure, GetUserLookupResponse>> getCompanyUserLookup({required int id});
  Future<Either<Failure, BoolResponse>> editUser({required int id,required UserRequest userRequest});
  Future<Either<Failure, GetSingleUserResponse>> addUser({required UserRequest userRequest});
}
