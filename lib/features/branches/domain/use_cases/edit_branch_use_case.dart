import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/branches/domain/entities/company_branch.dart';
import '../../../../core/api/base_api_response.dart';
import '../../../../core/error/failure.dart';
import '../repositories/branches_repository.dart';

class EditBranchUseCase {
  final BranchesRepository branchesRepository;
  EditBranchUseCase({
    required this.branchesRepository,
  });

  Future<Either<Failure, BoolResponse>> call({required int id,required CompanyBranch companyBranch}) async {
    return await branchesRepository.editBranch(id: id,companyBranch: companyBranch);
  }
}
