import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/branches/data/models/responses/add_branch_response_model.dart';
import 'package:invoice_app/features/branches/domain/entities/company_branch.dart';
import '../../../../core/error/failure.dart';
import '../repositories/branches_repository.dart';

class AddBranchUseCase {
  final BranchesRepository branchesRepository;
  AddBranchUseCase({
    required this.branchesRepository,
  });

  Future<Either<Failure, AddBranchResponse>> call({required CompanyBranch companyBranch}) async {
    return await branchesRepository.addBranch(companyBranch: companyBranch);
  }
}
