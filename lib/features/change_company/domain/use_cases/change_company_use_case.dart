import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/change_company/domain/repositories/change_company_repository.dart';
import '../../../../core/api/base_api_response.dart';
import '../../../../core/error/failure.dart';

class ChangeCompanyUseCase {
  final ChangeCompanyRepository changeCompanyRepository;
  ChangeCompanyUseCase({
    required this.changeCompanyRepository,
  });

  Future<Either<Failure, BoolResponse>> call({required int companyId}) async {
    return await changeCompanyRepository.changeCompany(companyId: companyId);
  }
}
