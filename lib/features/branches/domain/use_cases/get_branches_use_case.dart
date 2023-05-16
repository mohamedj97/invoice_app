import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/branches/domain/repositories/branches_repository.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/get_branches_response_model.dart';

class GetBranchesUseCase {
  final BranchesRepository branchesRepository;
  GetBranchesUseCase({
    required this.branchesRepository,
  });

  Future<Either<Failure, GetBranchesResponse>> call() async {
    return await branchesRepository.getCompanyBranches();
  }
}
