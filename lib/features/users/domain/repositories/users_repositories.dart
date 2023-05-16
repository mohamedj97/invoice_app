import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/users/data/models/responses/get_users_response_model.dart';
import '../../../../core/error/failure.dart';

abstract class UsersRepository {
  Future<Either<Failure, GetUsersResponse>> getCompanyUsers();
}
