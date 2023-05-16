import '../../../../../core/api/api_repo.dart';
import '../models/responses/get_branches_response_model.dart';

abstract class BranchesRemoteDataSource {
  Future<GetBranchesResponse> getCompanyBranches();
}

class BranchesRemoteDataSourceImpl extends BranchesRemoteDataSource {
  final APIRepository apiRepo;
  BranchesRemoteDataSourceImpl({
    required this.apiRepo,
  });

  @override
  Future<GetBranchesResponse> getCompanyBranches()async {
    final response = await apiRepo.branchesClient.getCompanyBranches();
    return response;
  }
}