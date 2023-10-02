import 'package:dartz/dartz.dart';
import '../../../../core/api/base_api_response.dart';
import '../../../../core/error/failure.dart';
import '../entities/get_company_users_result.dart';

abstract class ChangeCompanyRepository {

  Future<Either<Failure, BoolResponse>> changeCompany({required int companyId});
  Future<Either<Failure, GetUsersCompaniesResult>> getUserCompanies();
}
