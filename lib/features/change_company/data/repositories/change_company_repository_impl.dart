import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/change_company/domain/entities/get_company_users_result.dart';
import 'package:invoice_app/features/change_company/domain/repositories/change_company_repository.dart';
import '../../../../core/api/base_api_response.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/mixins/app_mixins.dart';
import '../data_sources/change_company_remote_data_source.dart';

class ChangeCompanyRepositoryImpl extends ChangeCompanyRepository with ConnectivityMixin {
  final ChangeCompanyRemoteDataSource changeCompanyRemoteDataSource;

  ChangeCompanyRepositoryImpl(this.changeCompanyRemoteDataSource);

  @override
  Future<Either<Failure, BoolResponse>> changeCompany({required int companyId}) async{
    try {
      final response = await changeCompanyRemoteDataSource.changeCompany(companyId: companyId);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetUsersCompaniesResult>> getUserCompanies() async{
    try {
      final response = await changeCompanyRemoteDataSource.getUserCompanies();

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }
}