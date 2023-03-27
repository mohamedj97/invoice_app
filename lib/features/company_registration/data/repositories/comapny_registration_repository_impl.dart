import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/core/error/failure.dart';
import 'package:invoice_app/features/company_registration/data/data_sources/remote_data_source/company_registration_remote_data_source.dart';
import 'package:invoice_app/features/company_registration/data/models/requests/company_register_request_model.dart';
import 'package:invoice_app/features/company_registration/data/models/responses/get_company_lookups_response_model.dart';
import 'package:invoice_app/features/company_registration/domain/repositories/company_registration_repository.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/mixins/app_mixins.dart';

class CompanyRegistrationRepositoryImpl extends CompanyRegistrationRepository with ConnectivityMixin {
  final CompanyRegistrationRemoteDataSource remoteDataSource;

  CompanyRegistrationRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, IntResponse>> registerCompany(
      {required CompanyRegisterRequestModel companyRegisterRequest, required int userId}) async {
    try {
      final response = await remoteDataSource.registerCompany(
          companyRegisterRequest: companyRegisterRequest, userId: userId);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, GetCompanyLookupsResponse>> getCompanyLookups({required int userId})async {
    try {
      final response = await remoteDataSource.getCompanyLookups(userId: userId);

      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
    }
  }
}
