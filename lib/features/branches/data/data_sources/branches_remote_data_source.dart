import 'package:invoice_app/core/api/base_api_response.dart';
import 'package:invoice_app/features/branches/data/models/responses/add_branch_response_model.dart';
import 'package:invoice_app/features/branches/domain/entities/company_branch.dart';

import '../../../../../core/api/api_repo.dart';
import '../models/responses/get_branches_response_model.dart';

abstract class BranchesRemoteDataSource {
  Future<GetBranchesResponse> getCompanyBranches();
  Future<BoolResponse> editBranch({required int id, required CompanyBranch companyBranch});
  Future<AddBranchResponse> addBranch({required CompanyBranch companyBranch});
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

  @override
  Future<AddBranchResponse> addBranch({required CompanyBranch companyBranch}) async{
    final response = await apiRepo.branchesClient.addBranch(companyBranch);
    return response;
  }

  @override
  Future<BoolResponse> editBranch({required int id, required CompanyBranch companyBranch}) async{
    final response = await apiRepo.branchesClient.editBranch(id,companyBranch);
    return response;
  }
}