import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/requests/company_register_request_model.dart';

abstract class CompanyRegistrationRepository {
  Future<Either<Failure, IntResponse>> registerCompany(
      {required CompanyRegisterRequestModel companyRegisterRequest, required int userId});
}
