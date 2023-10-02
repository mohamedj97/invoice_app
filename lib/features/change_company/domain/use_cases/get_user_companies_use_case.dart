import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/change_company/domain/repositories/change_company_repository.dart';
import '../../../../core/error/failure.dart';
import '../entities/get_company_users_result.dart';

class GetUserCompaniesUseCase {
  final ChangeCompanyRepository changeCompanyRepository;
  GetUserCompaniesUseCase({
    required this.changeCompanyRepository,
  });

  Future<Either<Failure, GetUsersCompaniesResult>> call() async {
    return await changeCompanyRepository.getUserCompanies();
  }
}
