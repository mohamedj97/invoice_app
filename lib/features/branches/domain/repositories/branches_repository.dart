import 'package:dartz/dartz.dart';
import 'package:invoice_app/features/branches/domain/entities/company_branch.dart';
import '../../../../core/api/base_api_response.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/responses/add_branch_response_model.dart';
import '../../data/models/responses/get_branches_response_model.dart';

abstract class BranchesRepository {
  Future<Either<Failure, GetBranchesResponse>> getCompanyBranches(int companyId);

  Future<Either<Failure, BoolResponse>> editBranch({required int id,required CompanyBranch companyBranch});

  Future<Either<Failure, AddBranchResponse>> addBranch({required CompanyBranch companyBranch});
}
