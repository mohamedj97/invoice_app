import 'package:dartz/dartz.dart';
import 'package:invoice_app/core/api/base_api_response.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/requests/company_register_request_model.dart';
import '../repositories/company_registration_repository.dart';

class RegisterCompanyUseCase {
  final CompanyRegistrationRepository companyRegistrationRepository;

  RegisterCompanyUseCase({
    required this.companyRegistrationRepository,
  });

  Future<Either<Failure, IntResponse>> call(
      {required CompanyRegisterRequestModel companyRegisterRequest, required int userId}) async {
    return await companyRegistrationRepository.registerCompany(
        userId: userId, companyRegisterRequest: companyRegisterRequest);
  }
}
