import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/roles/data/data_sources/roles_remote_data_source.dart';
import 'package:invoice_app/features/roles/data/models/responses/get_roles_response_model.dart';
import 'package:invoice_app/features/roles/domain/repositories/roles_repository.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/mixins/app_mixins.dart';

class RolesRepositoryImpl extends RolesRepository with ConnectivityMixin {
  final RolesRemoteDataSource rolesRemoteDataSource;

  RolesRepositoryImpl(this.rolesRemoteDataSource);

  @override
  Future<Either<Failure, GetRolesResponse>> getCompanyRoles() async{
    try {
      final response = await rolesRemoteDataSource.getCompanyRoles();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

}
