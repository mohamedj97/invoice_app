import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/get_company_lookups_response_model.dart';
import '../repositories/company_registration_repository.dart';

class GetCompanyLookupsUseCase {
  final CompanyRegistrationRepository companyRegistrationRepository;

  GetCompanyLookupsUseCase({
    required this.companyRegistrationRepository,
  });

  Future<Either<Failure, GetCompanyLookupsResponse>> call({required int userId}) async {
    return await companyRegistrationRepository.getCompanyLookups(userId: userId);
  }
}
