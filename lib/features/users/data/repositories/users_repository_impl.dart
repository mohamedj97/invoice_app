import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/users/data/data_sources/users_remote_data_source.dart';
import 'package:invoice_app/features/users/domain/repositories/users_repositories.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/mixins/app_mixins.dart';
import '../models/responses/get_users_response_model.dart';

class UsersRepositoryImpl extends UsersRepository with ConnectivityMixin {
  final UsersRemoteDataSource usersRemoteDataSource;

  UsersRepositoryImpl(this.usersRemoteDataSource);

  @override
  Future<Either<Failure, GetUsersResponse>> getCompanyUsers() async{
    try {
      final response = await usersRemoteDataSource.getCompanyUsers();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

}
